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


  desc "Load Student Observations or profiles . . . . "
  task :development_levels => :environment do

    @started = Time.now()
    @count = 0 

    # Process all the files available to allow incremental additions to the set of them over time.
    Dir.glob("public/data/sz/schools/Geneva/development_levels/*.csv").each do |filename|

      puts "\n process file: #{filename}"
    
      CSV.parse(File.read(filename), :encoding => "iso-8859-1", :headers => true) do |row|

        # Create new hash for this instance by sanitizing each element in row.  See
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
            #puts "#{p_hash[k]}"
          end
        end #parse
        puts "--begin #{@count}\n"        
        puts "Student:  #{p_hash['Student']}"
        puts "Date:     #{p_hash['Date']}"
        puts "Recorder: #{p_hash['Recorder']}"

        puts "Fac by A not:    #{p_hash['Fac by A not']}"
        puts "Fac by A Fleet:  #{p_hash['Fac by A Fleet']}"
        puts "Fac by A Const:  #{p_hash['Fac by A Const']}"
        puts "Fac by A Stable: #{p_hash['Fac by A Stable']}"

        puts "Initiated by Child not:    #{p_hash['Initiated by Child not']}"
        puts "Initiated by Child fleet:  #{p_hash['Initiated by Child fleet']}"
        puts "Initiated by Child const:  #{p_hash['Initiated by Child const']}"
        puts "Initiated by Child stable: #{p_hash['Initiated by Child stable']}"

        puts "Sensory-Motor not:    #{p_hash['Sensory-Motor not']}"
        puts "Sensory-Motor Fleet:  #{p_hash['Sensory-Motor Fleet']}"
        puts "Sensory-Motor const:  #{p_hash['Sensory-Motor const']}"
        puts "Sensory-Motor stable: #{p_hash['Sensory-Motor stable']}"

        puts "Pleasure not:    #{p_hash['Pleasure not']}"
        puts "Pleasure fleet:  #{p_hash['Pleasure fleet']}"
        puts "Pleasure const:  #{p_hash['Pleasure const']}"
        puts "Pleasure Stable: #{p_hash['Pleasure Stable']}"

        puts "Displeasure not:    #{p_hash['Displeasure not']}"
        puts "Displeasure fleet:  #{p_hash['Displeasure fleet']}"
        puts "Displeasure Const:  #{p_hash['Displeasure Const']}"
        puts "Displeasure Stable: #{p_hash['Displeasure Stable']}"

        puts "With Object not:    #{p_hash['With Object not']}"        
        puts "With Object Fleet:  #{p_hash['With Object Fleet']}"        
        puts "With Object Const:  #{p_hash['With Object Const']}"        
        puts "With Object Stable: #{p_hash['With Object Stable']}"        

        puts "--end #{@count}\n\n"

        # Update the Student and if none exists create it.  No duplicates, so use .first_or_create.
        # ,Date,Student,Birth date,Grade,Teacher, ...
        student = Student.where(:name => p_hash['Student']).first_or_create
        student.born_on ||= p_hash['Birth']        
        
        # Save provider but only create polymorphic dependents if name given and 
        # save is successful.
        if !student.name.nil? and student.save! 
          puts "--#{student.name} from #{filename} Saved\n\n\n"
        else
          puts "--Provider could not be saved, Dropped\n"
        end #if

        # Create this instance of Developmental_levels for this student
        # FIXME -- Protect this action or at least recover from FAIL
        dl = student.developmental_levels.create(
          recorder: p_hash['Recorder'],
          pleasure: 1,
          displeasure: 1,
          with_object: 1
          )
        dl.facilitated_by_adult = 1 if p_hash['Fac by A not'] == 'Yes'
        dl.facilitated_by_adult = 2 if p_hash['Fac by A Fleet'] == 'Yes'
        dl.facilitated_by_adult = 3 if p_hash['Fac by A Const'] == 'Yes'
        dl.facilitated_by_adult = 4 if p_hash['Fac by A Stable'] == 'Yes'

        dl.initiated_by_child = 1 if p_hash['Initiated by Child not'] == 'Yes'
        dl.initiated_by_child = 2 if p_hash['Initiated by Child fleet'] == 'Yes'
        dl.initiated_by_child = 3 if p_hash['Initiated by Child const'] == 'Yes'
        dl.initiated_by_child = 4 if p_hash['Initiated by Child stable'] == 'Yes'

        dl.sensory_motor = 1 if p_hash['Sensory-Motor not'] == 'Yes'
        dl.sensory_motor = 2 if p_hash['Sensory-Motor Fleet'] == 'Yes'
        dl.sensory_motor = 3 if p_hash['Sensory-Motor const'] == 'Yes'
        dl.sensory_motor = 4 if p_hash['Sensory-Motor stable'] == 'Yes'

        dl.pleasure = 1 if p_hash['Pleasure not'] == 'Yes'
        dl.pleasure = 2 if p_hash['Pleasure fleet'] == 'Yes'
        dl.pleasure = 3 if p_hash['Pleasure const'] == 'Yes'
        dl.pleasure = 4 if p_hash['Pleasure Stable'] == 'Yes'

        dl.displeasure = 1 if p_hash['Displeasure not'] == 'Yes'
        dl.displeasure = 2 if p_hash['Displeasure fleet'] == 'Yes'
        dl.displeasure = 3 if p_hash['Displeasure Const'] == 'Yes'
        dl.displeasure = 4 if p_hash['Displeasure Stable'] == 'Yes'

        dl.with_object = 1 if p_hash['With Object not'] == 'Yes'
        dl.with_object = 2 if p_hash['With Object Fleet'] == 'Yes'
        dl.with_object = 3 if p_hash['With Object Const'] == 'Yes'
        dl.with_object = 4 if p_hash['With Object Stable'] == 'Yes'

        dl.save
      end #parse row

    end #glob

    puts "\n--Finished."
    puts "Development Levels: #{@count.to_s}"
    puts "Elapsed time: #{(Time.now() - @started)}"

  end #task

end #namespace
