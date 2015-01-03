class Observation < ActiveRecord::Base

belongs_to :student

 validate :student_id, presence: true
 validate :validate_date
  
  def validate_date
    if observed_on.nil? or observed_on > Date.today
      errors.add(:observed_on, "PROBLEM:  Observation date cannot be in the future.")
    end #if
  end #method
end
