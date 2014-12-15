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

  #
  # getProgress -- takes string x as one of the progress categories, e.g. 'facilitated_by_adult',
  # retrieves observations on these from DevelopmentalLevels and creates a rudimentary sparkline as
  # aid to visual display of student's progress to date.  Progress_category(s) are :attributes in DevelopmentalLevels.
  # FIXME -- Add protection for invalid values of x; PG::UndefinedColumn ERROR: column "#{x}" does not exist
  #
  def getProgress progress_category
    student = Student.find(id)
    dls = student.developmental_levels.select(progress_category).order(observed_on: :asc)
    history = ""
    dls.each do | dl |
      history += dl.send(progress_category.to_sym).to_s + '-'
    end
    history
  end

end #class
