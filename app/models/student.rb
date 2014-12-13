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

  def getFBA
    student = Student.find(id)
    dls = student.developmental_levels.select("facilitated_by_adult").order(observed_on: :asc)
    history = ""
    dls.each do | dl |
      history += dl.facilitated_by_adult.to_s + '-'
    end
    history
  end

  def getIBC
    student = Student.find(id)
    dls = student.developmental_levels.select("initiated_by_child")
    history = ""
    dls.each do | dl |
      history += dl.initiated_by_child.to_s + '-'
    end
    history
  end

  def getSM
    student = Student.find(id)
    dls = student.developmental_levels.select("sensory_motor")
    history = ""
    dls.each do | dl |
      history += dl.sensory_motor.to_s + '-'
    end
    history
  end

end #class
