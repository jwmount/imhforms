#
# Root load rake command
# Add argument values eventually to select which school is to be loaded, default is all
#
require 'csv'
require 'uri'

namespace :load do

  desc "imhforms -- Database load from .csv files, loading . . . ."
  task :main => :environment do
    Rake::Task['load:observations'].invoke
    Rake::Task['load:development_levels'].invoke
    puts 'imhforms load completed.'
  end

#
# helper methods
#

  def getProgress progress_category
    1
  end

  def sanitize_utf8(string)
    return nil if string.nil?
    return string if string.valid_encoding?
    string.chars.select { |c| c.valid_encoding? }.join
  end


end #namespace

  

