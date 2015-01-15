#
# rake load:summary
#
namespace :load do

  desc "imhforms -- :all.  Show summaries for tables."
  task :summary => :environment do

    obs      = Observation.count
    students = Student.all

    students.each do |s|
      @dls = s.developmental_levels.all
      @dls.each { |d| puts "         --  #{s.name} on #{d.observed_on}" }
      puts "         -- DevelopmentalLevel: #{s.name},  #{@dls.count} observations\n"
    end

    puts "\n\n"
    puts "imhforms -- Summary of tables."
    puts "         -- Students:  \t\t     #{students.count}"
    puts "         -- Observations: \t    #{obs}\n"
    puts "Done."

  end
end