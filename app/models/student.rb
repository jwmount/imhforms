class Student < ActiveRecord::Base

  has_many :observations, 
           :dependent => :destroy
  has_many :developmental_levels,
           :dependent => :destroy

  validates_presence_of :name
  validate :validate_date
  
  def validate_date
    if born_on.nil? or born_on > Date.today
      errors.add(:date_on, "PROBLEM:  Birth date must be past.")
    end #if
  end #method

end #class
