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
=begin
        # get observation if one exists (validated to unique so only one can exist) or
        # create new one.
        # ,Date,Student,Birth date,Grade,Teacher, ...
        observation = Observation.where(:name => p_hash['student']).first_or_create
        observations.birthdate ||= p_hash['Birth']
        observation.grade = p_hash['Grade']
        observation.teacher = p_hash['Teacher']
        
        

    HARDLY OPERATIONAL ! ! ! !
    
        # Save provider but only create polymorphic dependents if name given and 
        # save is successful.
        if !provider.name.nil? and provider.save! 
          puts "--#{provider.name} from #{filename} Saved\n\n\n"

          address = Address.where(addressable_id: provider[:id], addressable_type: 'Provider').first_or_create
          address.street         = p_hash['Street Address']
          address.locality       = p_hash['City']
          address.state          = p_hash['State']
          address.post_code      = p_hash['Zipcode'] 
          address.country        = 'United States'
         # address.attributes.each {|k,v| puts "#{k}:\t\t#{v}"}
          address.save

          phone = Rolodex.where(rolodexable_id: provider[:id], kind: 'Office number', rolodexable_type: 'Provider').first_or_create
          phone.number_or_email = p_hash['Telephone #']
         # phone.attributes.each {|k,v| puts "#{k}:\t\t#{v}"}
          phone.save        
        else
          puts "--Provider could not be saved, Dropped\n"
        end #if

=end
      end #parse row

    end #glob

    puts "\n--Finished."
    puts "Observations: #{Observation.count}"
    puts "Elapsed time: #{(Time.now() - @started)}"

  end #task

end #namespace
