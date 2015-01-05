#require 'debugger'
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

    # A panel will be rendered for each of these behaviors.  These MUST match :attribute method
    # names in DevelopmentalLevels.
    def behaviors
      ['facilitated_by_adult', 'initiated_by_child', 'sensory_motor', 'pleasure',
        'displeasure', 'with_object', 'sensory_motor_play', 'representational_play',
        'with_adult_support', 'independently', 'cross_context_1', 'cross_context_2',
        'cross_context_3', 'cross_context_4']
    end

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
    def date_buckets
      min = DevelopmentalLevel.minimum("observed_on")
      @buckets = [min, min+15, min+30, min+45, min+60, min+75, min+90, 
                       min+105, min+120, min+135, min+150, min+165 ]
      
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

=begin
      panel "Initiated By Child" do
        table  do
        
          tr 
            th h3 'Recorders'
            date_buckets.each do |date|
              th h3 b date
            end
          recorders.each do |name|
            tr
              td h3 b name
              td evaluations "Initiated By Child", name
              td 2
              td 3
              td 4
          end #teachers
        end
      end
=end
      

    end
  end