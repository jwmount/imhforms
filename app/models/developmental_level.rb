class DevelopmentalLevel < ActiveRecord::Base

  belongs_to :student
  
  validate :validate_date
  validate :duration, presence: true
  validate :student_id, presence: true
  validate :recorder

  def validate_date
    if observed_on.nil? or observed_on > Date.today
      errors.add(:observed_on, "PROBLEM:  Observation date must be provided and cannot be in the future.")
    end #if
  end #method
end #class
