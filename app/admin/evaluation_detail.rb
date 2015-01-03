 ActiveAdmin.register_page "Evaluation Detail" do

    content do

    def behaviors
    	%w[fba idc sm pleasure displeasure stable]
    end

 	def getStudent
 		Student.first.name
    end

    def teachers
    	%w[Smith Jones Maceo Zixus]
    end

    def date_buckets
      min = DevelopmentalLevel.minimum("observed_on")
      max = DevelopmentalLevel.maximum("observed_on")
      #%w[2014-12-01 2014-12-16 2015-01-01 2015-01-16 2015-02-01 2015-02-16]
      [min, min+15, min+30, min+45, min+60, min+75, min+90]
    end

    def evaluations teacher
    	11
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
          teachers.each do |name|
            tr
            	td h3 b name
            	td evaluations name
            	td 2
            	td 3
          	  td 4
          end
        end
      end

      panel "Initiated By Child" do
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