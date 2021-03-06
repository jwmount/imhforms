#
# rake load:summary
#
namespace :load do

  desc "imhforms -- :summary.  Show summaries for tables."
  task :summary => :environment do


    students.each do |s|
      @dls = s.developmental_levels.all
      @dls.each { |d| puts "         --  #{s.name} on #{d.observed_on}" }
      puts "         -- DevelopmentalLevel: #{s.name},  #{@dls.count} observations\n"
    end

    puts "\n\n"
    puts "imhforms -- Summary of tables."
    puts "         -- Students:  \t\t     #{Student.count}"
    puts "         -- DevelopmentalLevels: #{DevelopmentalLevel.count}"
    puts "         -- Observations: \t    #{Observation.count}\n"
    puts "Done."

  end
end