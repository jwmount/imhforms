require 'Date'
class DevelopmentalLevel < ActiveRecord::Base

  belongs_to :student

  #
  # V A L I D A T I O N S
  #

  validate :validate_date
  validate :duration, presence: true
  validate :student_id, presence: true
  validate :recorder, presence: true

  # TODO -- Create a way to warn the admin user a date is missing and defaulted.
  def validate_date
    if self.observed_on.nil?
      #errors.add(:observed_on, "NOTE: No observation date given, used today's date.")
      self.observed_on = Date.today
    end
    if self.observed_on > Date.today
      errors.add(:observed_on, "PROBLEM:  Observation date must be provided and cannot be in the future.")
    end #if
  end #method

end #class
