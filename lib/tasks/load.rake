
#
# Root load rake command
# Add argument values eventually to select which school is to be loaded, default is all
#
require 'csv'
require 'uri'

# TODO -- Add command syntax

namespace :load do

  desc "imhforms -- :all.  Database load from .csv files."
  task :all => :environment do
    Rake::Task['load:observations'].invoke
    Rake::Task['load:development_levels'].invoke
    puts 'imhforms -- load completed.'
  end

#
# helper methods
#

  def isPresent(hsh, keys)
    keys.each do |key| 
      if !hsh.has_key?(key)
        return false, key
      end
    end
  end

  def sanitize_utf8(string)
    return nil if string.nil?
    return string if string.valid_encoding?
    string.chars.select { |c| c.valid_encoding? }.join
  end


end #namespace

  

