require 'csv'
require 'uri'
#
# LOAD Student Observations (effectively Profiles)
# $ rake load:observations
# source data: public/data/sz/schools/observations.csv

# Columns are:
# ,Date,Student,Birth date,Grade,Teacher,Allergies,Special Diet / food issues,Sleep,Elimination patterns,
# Other medical concerns,Text10.0,Text10.1,Text10.2,Text10.3,Text11.0,Text11.1,Text11.2,Text11.3,Text11.4,
# Text12.0,Text12.1,Text12.2,Text12.3,Text12.4,Text12.5,Text12.6,Text13,Text14.0.0,Text14.0.1,Text14.0.2,
# Text14.0.3,Text14.0.4,Text14.0.5,Text14.0.6,Text14.0.7,Text15.0,Text15.1,Text15.2,Text15.3,Text15.4,
# Text15.5#

namespace :load do

# TODO -- Add command syntax
  desc "imhforms -- Load observations . . . . "
  task :observations => :environment do

    @started = Time.now()
    @count = 0 


    Dir.glob("public/data/sz/schools/Geneva/observations/*.csv").each do |filename|

      puts "\n process file: #{filename}"
    
      CSV.parse(File.read(filename), :encoding => "iso-8859-1", :headers => true) do |row|

        # Create new hash for profile by sanitizing each element in row.  See
        # If row begins with '#' it's a comment.
        # Gist 'Invalid UTF8 in .csv' for discussion of this.     
        p_hash = Hash.new(nil)
        @count = @count + 1
        if row.index(/[# ]/, 0) 
          puts row
          next
        else
          row.each do |k,v|
            p_hash[k] = sanitize_utf8(v)
          end
        end
        puts @count

        # Update the Student and if none exists create it.  No duplicates, so use .first_or_create.
        # ,Date,Student,Birth date,Grade,Teacher,Allergies, ...
        student = Student.where(:name => p_hash['Student']).first_or_create
        student.born_on ||= p_hash['Birth']        
        
        # Save provider but only create polymorphic dependents if name given and 
        # save is successful.
        if !student.name.nil? and student.save! 
          puts "--#{student.name} from #{filename} Saved\n\n\n"
        else
          puts "--Student #{p_hash['Student']} from #{filename} could not be saved, Dropped\n"
        end #if

        # Create this instance of Developmental_levels for this student
        # FIXME -- Protect this action or at least recover from FAIL
        dl = student.observations.create(
          observed_on: p_hash['Date'],
          grade:       p_hash['Grade'],
          teacher:     p_hash['Teacher'],
          allergies:   p_hash['Allergies'],
          diet:        p_hash['Special Diet / food issues'],
          sleep:       p_hash['Sleep'],
          elimination: p_hash['Elimination patterns'],
          stability:   p_hash['Stability'],
          concerns:    p_hash['Other medical concerns']
          )
      end #parse row

    end #glob

    puts "\n--Finished."
    puts "Observations: #{Observation.count}"
    puts "Elapsed time: #{(Time.now() - @started)}"

  end #task

end #namespace
