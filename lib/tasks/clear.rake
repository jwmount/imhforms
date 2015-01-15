#
# rake load:summary
#
namespace :load do

  desc "imhforms -- :clear.  Clear data from tables."
  task :clear => :environment do

    dls      = DevelopmentalLevel.delete_all
    obs      = Observation.delete_all
    students = Student.delete_all

    puts "Done."

  end
end