#require 'debugger'
 ActiveAdmin.register_page "Evaluation Detail" do


  controller do

    # FIXME -- Flag user what params were passed and find out why :format instead of :id?
    def index
      flash[:warning] = "#{params.inspect}"
    end

  end

  content do

    def behaviors
    	%w[fba idc sm pleasure displeasure stable]
    end

   	def getStudent
        @student = Student.find params[:format]
        @student.name
    end

    # here we want an [] of unique recorder names
    def teachers
      @r = [""]
      dls = @student.developmental_levels.select("recorder")
      dls.each { |d| @r << d.recorder }
      @r.uniq!
    end

    def date_buckets
      min = DevelopmentalLevel.minimum("observed_on")
      @buckets = [min, min+15, min+30, min+45, min+60, min+75, min+90]
    end

    # for each recorder (teacher), return array of evaluations to match date_buckets
    def evaluations behavior, teacher
      return "" if teacher.empty?
      vs = DevelopmentalLevel.where("recorder = ?", teacher)
      td vs[0].facilitated_by_adult        
    end

#
#  Render Page
#
      para h2 "#{getStudent}"

      panel "Facilitated By Child" do
        table  do
        
          tr 
            th h3 'Recorders'
            date_buckets.each do |date|
              th h3 b date
            end
          teachers.each do |name, count|
            tr
              td h4 b name
              evaluations 'facilitated_by_adult', name
          end #teachers
        end
      end

      panel "Initiated By Child" do
        table  do
        
          tr 
            th h3 'Recorders'
            date_buckets.each do |date|
              th h3 b date
            end
          teachers.each do |name|
            tr
              td h3 b name
              td evaluations "Initiated By Child", name
              td 2
              td 3
              td 4
          end #teachers
        end
      end

      panel "Sensory Motor"
      panel "Pleasure"
      panel "Displeasure"
      panel "With Object"
      panel "Sensory Motor Play"
      panel "Representational Play"
      panel "With Adult Support"
      panel "Independently"
      panel "Accosss Contexts A1"
      panel "Accosss Contexts 2"
      panel "Accosss Contexts 3"
      panel "Accosss Contexts 4"

      

    end
  end