module StudentsHelper

  def student_name
  	name = (Student.find 1).name
  end

  
end
