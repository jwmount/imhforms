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
    def date_buckets
      min = @student.developmental_levels.minimum("observed_on")
      max = @student.developmental_levels.maximum("observed_on")
      @buckets = [min, min+15.days, min+30.days, min+45.days, min+60.days, min+75.days, min+90.days, 
                       min+105.days, min+120.days, min+135.days, min+150.days, min+165.days, min+180.days ]
    end

    # for each recorder, return array of evaluations to match date_buckets.
    # if no value is recorded for a bucket, it's blank.
    def evaluations behavior, recorder, bucket
      return "0" if recorder.empty?
      vs = @student.developmental_levels.where("recorder = ? and observed_on >= ? and observed_on < ?", recorder, bucket[0], bucket[1] ).select("#{behavior}").first
      td vs.send( behavior.to_sym ) unless vs.nil?
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
                evaluations behavior, name, [@buckets[0], @buckets[1]]
                evaluations behavior, name, [@buckets[1], @buckets[2]]
                evaluations behavior, name, [@buckets[2], @buckets[3]]
                evaluations behavior, name, [@buckets[3], @buckets[4]]
                evaluations behavior, name, [@buckets[4], @buckets[5]]
                evaluations behavior, name, [@buckets[5], @buckets[6]]
                evaluations behavior, name, [@buckets[6], @buckets[7]]
            end #recorders
          end
        end
      end #behaviors iterator      

    end
  end