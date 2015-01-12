 ActiveAdmin.register_page "Evaluation Detail" do

  # It is not meaningful to render the page with no student selected, so no menu.
  menu false

  controller do

    # FIXME -- Flag user what params were passed and find out why :format instead of :id?
    def index
      # flash[:notice] = "#{params.inspect}"  # for debugging
      @student = Student.find params[:format]
      if @student.developmental_levels.count == 0
        flash[:warning] = "There are no behavior assesements recorded yet for #{@student.name}."
        redirect_to admin_student_path(@student)
      end
    end

  end

  content do

   	def getStudent
      begin
        @student = Student.find params[:format]
      rescue
        flash[:notice] = "No student requested, first one will be used."
        begin
          @student = Student.first
        rescue
          flash[:error] = "There are no students in the database."
          redirect_to admin_students_path
        end
      end
        @student.name
    end

    # here we want an [] of unique recorder names
    def recorders
      @r = []
      dls = @student.developmental_levels.select("recorder")
      dls.each { |d| @r << d.recorder }
      @r.uniq!
    end

    # Date intervals (buckets), every 15 days beginning 1 Nov 2014
    # Work out how to inject the dates or something and don't issue any beyond max observe_on
    # If @buckets exists just return it as will be same for given student.
    # FIXME -- This should based on ranges as in Dashboard.
    def date_buckets
      return @buckets unless @buckets.nil?
      min, max = Date.new()
      min = @student.developmental_levels.minimum("observed_on")
      max = @student.developmental_levels.maximum("observed_on")
      @buckets = [min]
      until (@buckets.max > max) do
        @buckets << (@buckets.max + 15.days)
      end
      @buckets
    end
    
    # for each recorder, return array of evaluations to match date_buckets.
    # if no value is recorded for a bucket, it's blank.
    def evaluations behavior, recorder, bucket
      #return "0" if recorder.empty?
      vs = @student.developmental_levels.where("recorder = ? and observed_on >= ? and observed_on < ?", recorder, bucket[0], bucket[1] ).select("#{behavior}")
      values = ""
      vs.each do |v|
        values += (v.send( behavior.to_sym ).to_s + ', ') unless v.nil?
      end
      return values.chomp(', ')
    end

#
#  Render Page
#
      para h2 "#{getStudent}"
      behaviors.each do |behavior|
        panel behavior.gsub('_',' ').capitalize! do
          table  do
        
            tr 
              th h3 'Recorders'
              date_buckets.each do |date|
                th h4 b date
              end

            recorders.each do |name, count|
              tr
                td h4 b name
                @buckets.each do |b|
                  td evaluations( behavior, name, [b, b+15] )
                end
            end #recorders
          end
        end
      end #behaviors iterator      

    end
  end