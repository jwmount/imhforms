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

    
    # In this version @buckets is an array of ranges, i.e. @buckets[0] = range(first, last)
    # Each month has two ranges, namely 1 - 15 and 16 - end.
    # Reference:  Date Class Ruby
    # TODO -- last bucket can be/is one period in future, don't need to show this.
    # TODO -- Not DRY, should be. Version is same as the one in evalutation_details.rb except that one scopes to @student.  

    def date_buckets

      min = Date.new( 2014, 11,  1 )
      mid = Date.new( 2014, 11, 15 )
      max = Date.new( 2014, 11, 30 ) 
      @buckets = [Range.new( min, mid ), Range.new( mid + 1.day, max)]

      # now based on period.min we get the first element of @buckets which is itself a range
      until @buckets.last.last > Date.today  do 
        first_day = @buckets.last.max + 1.day
        mid = Date.new(first_day.year, first_day.month, 15)
        last_day =  first_day + 1.month - 1
        @buckets << Range.new( first_day, mid )
        @buckets << Range.new( mid + 1.day, last_day)
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
              date_buckets.each do |bucket|
                th h4 b bucket.first.strftime("%b #{bucket.first.day}-#{bucket.last.day}, %Y")
              end

            recorders.each do |name, count|
              tr
                td h4 b name
                @buckets.each do |b|
                  td evaluations( behavior, name, [b.first, b.last] )
                end
            end #recorders
          end
        end
      end #behaviors iterator      

    end
  end