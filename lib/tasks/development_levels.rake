require 'csv'
require 'uri'
#
# LOAD Stage 1, Developmental Levels and Students
# $ rake load:developmental_levels
# source data: public/data/sz/schools/developmental_levels.csv

# PAGE 1 Columns are:
# ,Student,Date:,Recorder,
# Fac by A not,Fac by A Fleet,Fac by A Const,Fac by A Stable,
# Initiated by Child not,Initiated by Child fleet,Initiated by Child const,Initiated by Child stable,
# Sensory-Motor not,Sensory-Motor Fleet,Sensory-Motor const,Sensory-Motor stable,
# Pleasure not,Pleasure fleet,Pleasure const,Pleasure Stable,
# Displeasure not,Displeasure fleet,Displeasure Const,Displeasure Stable,
# With Object not,With Object Fleet,With Object Const,With Object Stable,
# time 1:1,Text14,Notes 1.1, ...
# PAGE 2
# Sensory Motor Play Not,Sensory Motor Play fleet,Sensory Motor Play Const,Sensory Motor Play Stacle,
# Representational Play not,Representational Play fleet,Representational Play Const,Representational Play stable,
# With Support Adult not,With Support Adult fleet,With Support Adult const,With Support Adult stable,
# Independently not,Independently fleet,Independently const,Independently stable,
# Across Contexts A1,Across Contexts not,Across Contexts fleet,Across Contexts const,Across Contexts stable,
# Across Contexts A2,Across Contexts 2 not,Across Contexts 2 fleet,Across Contexts 2 const,Across Contexts 2 stable,
# Across Contexts A3,Across Contexts 3 not,Across Contexts 3 fleet,Across Contexts 3 const,Across Contexts 3 stable,
# Across Contexts A4,Across Contexts 4 not,Across Contexts 4 fleet,Across Contexts 4 const,Across Contexts 4 stable,
# Time 1:2,Text15,Notes 1.2, ...

namespace :load do

# TODO -- Add command syntax

        keys = [ 'Fac by A not', 'Fac by A not', 'Fac by A not', 'Fac by A not',
                 'Initiated by Child not', 'Initiated by Child fleet', 'Initiated by Child const', 'Initiated by Child stable',
                 'Sensory-Motor not', 'Sensory-Motor Fleet', 'Sensory-Motor const', 'Sensory-Motor stable',
                 'Pleasure not', 'Pleasure fleet', 'Pleasure const', 'Pleasure Stable',
                 'Displeasure not', 'Displeasure fleet', 'Displeasure Const', 'Displeasure Stable',
                 'With Object not', 'With Object Fleet', 'With Object Const', 'With Object Stable',
                 'Sensory Motor Play Not', 'Sensory Motor Play fleet', 'Sensory Motor Play Const', 'Sensory Motor Play Stacle',
                 'Representational Play not', 'Representational Play fleet', 'Representational Play Const', 'Representational Play stable',
                 'With Support Adult not', 'With Support Adult fleet', 'With Support Adult const', 'With Support Adult stable', 
                 'Independently not', 'Independently fleet', 'Independently const', 'Independently stable',

                 'Across Contexts not', 'Across Contexts fleet', 'Across Contexts const', 'Across Contexts stable', 
                 'Across Contexts 2 not', 'Across Contexts 2 fleet', 'Across Contexts 2 const','Across Contexts 2 stable',
                 'Across Contexts 3 not', 'Across Contexts 3 fleet', 'Across Contexts 3 const', 'Across Contexts 3 stable',
                 'Across Contexts 4 not', 'Across Contexts 4 fleet', 'Across Contexts 4 const', 'Across Contexts 4 stable',
        ]

  desc "imhforms -- Load developmental_levels . . . . "
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
        puts "Date:     #{p_hash['Date:']}"            # Note trailing colon, is in CSV header def.
        puts "Recorder: #{p_hash['Recorder']}"

        puts "--end #{@count}\n\n"


        #
        # If any key is missing, message which one and terminate
        #
        flag, key = isPresent(p_hash, keys)
        
        unless flag 
            puts "ERROR -- Key: '#{key}' not found.  Terminated."
            Process.exit(0)
        end
        
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
          observed_on: p_hash['Date:']      # NOTE:  colon is part of column name
          )

    # Stage 1 (?)
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

# Page 2 of Stage 1
# FIXME 'Stable' not 'Stacle'        
        dl.sensory_motor_play = 1 if p_hash['Sensory Motor Play Not'] == 'Yes'
        dl.sensory_motor_play = 2 if p_hash['Sensory Motor Play fleet'] == 'Yes'
        dl.sensory_motor_play = 3 if p_hash['Sensory Motor Play Const'] == 'Yes'
        dl.sensory_motor_play = 4 if p_hash['Sensory Motor Play Stacle'] == 'Yes'

        dl.representational_play = 1 if p_hash['Representational Play not'] == 'Yes'
        dl.representational_play = 2 if p_hash['Representational Play fleet'] == 'Yes'
        dl.representational_play = 3 if p_hash['Representational Play Const'] == 'Yes'
        dl.representational_play = 4 if p_hash['Representational Play Stable'] == 'Yes'

        dl.with_adult_support = 1 if p_hash['With Support Adult not'] == 'Yes'
        dl.with_adult_support = 2 if p_hash['With Support Adult fleet'] == 'Yes'
        dl.with_adult_support = 3 if p_hash['With Support Adult const'] == 'Yes'
        dl.with_adult_support = 4 if p_hash['With Support Adult stable'] == 'Yes'

        dl.independently = 1 if p_hash['Independently not'] == 'Yes'
        dl.independently = 2 if p_hash['Independently fleet'] == 'Yes'
        dl.independently = 3 if p_hash['Independently const'] == 'Yes'
        dl.independently = 4 if p_hash['Independently stable'] == 'Yes'

        dl.cross_context_1 = 0 if p_hash['Across Contexts A1'] == 'Yes'
        dl.cross_context_1 = 1 if p_hash['Across Contexts not'] == 'Yes'
        dl.cross_context_1 = 2 if p_hash['Across Contexts fleet'] == 'Yes'
        dl.cross_context_1 = 3 if p_hash['Across Contexts const'] == 'Yes'
        dl.cross_context_1 = 4 if p_hash['Across Contexts stable'] == 'Yes'

        dl.cross_context_2 = 0 if p_hash['Across Contexts 2'] == 'Yes'
        dl.cross_context_2 = 1 if p_hash['Across Contexts 2 not'] == 'Yes'
        dl.cross_context_2 = 2 if p_hash['Across Contexts 2 fleet'] == 'Yes'
        dl.cross_context_2 = 3 if p_hash['Across Contexts 2 const'] == 'Yes'
        dl.cross_context_2 = 4 if p_hash['Across Contexts 2 stable'] == 'Yes'

        dl.cross_context_3 = 0 if p_hash['Across Contexts 3'] == 'Yes'
        dl.cross_context_3 = 1 if p_hash['Across Contexts 3 not'] == 'Yes'
        dl.cross_context_3 = 2 if p_hash['Across Contexts 3 fleet'] == 'Yes'
        dl.cross_context_3 = 3 if p_hash['Across Contexts 3 const'] == 'Yes'
        dl.cross_context_3 = 4 if p_hash['Across Contexts 3 stable'] == 'Yes'

        dl.cross_context_4 = 0 if p_hash['Across Contexts 4'] == 'Yes'
        dl.cross_context_4 = 1 if p_hash['Across Contexts 4 not'] == 'Yes'
        dl.cross_context_4 = 2 if p_hash['Across Contexts 4 fleet'] == 'Yes'
        dl.cross_context_4 = 3 if p_hash['Across Contexts 4 const'] == 'Yes'
        dl.cross_context_4 = 4 if p_hash['Across Contexts 4 stable'] == 'Yes'

# TODO -- Rescue this save operation
        dl.save!
        puts "--#{dl.student.name} from #{filename} Saved.\n\n\n"

      end #parse row

    end #glob

    puts "\n--Finished."
    puts "Development Levels: #{@count.to_s}"
    puts "Elapsed time: #{(Time.now() - @started)}"

  end #task

end #namespace
