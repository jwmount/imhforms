#
# rake load:summary
#
namespace :load do

  desc "imhforms -- :summary.  Show summaries for tables."
  task :show => :environment do

    students = Student.all
    students.each do |s|
      puts s.inspect
      puts "\n"
      dls = s.developmental_levels.all
      dls.each do |d| 
        puts "         --  #{s.name} --> #{d.inspect}" 
      end
    end

    puts "\n\n"
    puts "imhforms -- Show contents tables."
    puts "         -- Students:  \t\t     #{Student.count}"
    puts "         -- DevelopmentalLevels: #{DevelopmentalLevel.count}"
    puts "         -- Observations: \t    #{Observation.count}\n"
    puts "Done."

  end
end