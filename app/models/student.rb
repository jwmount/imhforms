class Student < ActiveRecord::Base

has_many :observations, 
         :dependent => :destroy
         
end
