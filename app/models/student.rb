class Student < ActiveRecord::Base

  has_many :observations, 
           :dependent => :destroy
  has_many :developmental_levels,
           :dependent => :destroy

end
