# If these values are changed, re-run migrations or reload schema
# $ bundle exec rake db:drop db:create db:schema:load db:seed
# Internationalization, see http://stackoverflow.com/questions/3629894/internationalization-for-constants-hashes-in-rails-3
module AdminConstants
#
# Generics
#
  ADMIN_OBSERVATION_BORN_ON_LABEL             = "Birth date:" 
  ADMIN_OBSERVATION_DATE_ON_LABEL             = "Observation date:" 
  ADMIN_OBSERVATION_DATE_ON_HINT              = "Date of observation."
  ADMIN_OBSERVATION_DATE_ON_PLACEHOLDER       = "mm-dd-yyyy"

  ADMIN_NOT_PRESENT_LABEL                     = "Not present"
  ADMIN_FLEETING_LABEL                        = "Fleeting"
  ADMIN_CONSTRICTED_LABEL                     = "Constricted"
  ADMIN_STABLE_LABEL                          = "Stable"

#
# Development_Levels
#
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_LABEL       = "Recorded by:"
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_HINT        = "Person who entered this observation."
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_PLACEHOLDER = "name"
  
  ADMIN_DEVELOPMENT_LEVEL_DURATION_LABEL       = "Duration observed, minutes" 
  ADMIN_DEVELOPMENT_LEVEL_DURATION_HINT        = "How long the child exhibited this behavior."
  ADMIN_DEVELOPMENT_LEVEL_DURATION_PLACEHOLDER = "minutes"

#
# Observations
#
  ADMIN_OBSERVATION_STUDENT_HINT               = "Student name"
  ADMIN_OBSERVATION_STUDENT_PLACEHOLDER        = "Ives Montand"

  ADMIN_OBSERVATION_GRADE_HINT                 = "Grade or year of school."
  ADMIN_OBSERVATION_GRADE_PLACEHOLDER          = "2nd form"

  ADMIN_OBSERVATION_TEACHER_HINT               = "Teacher's name."
  ADMIN_OBSERVATION_TEACHER_PLACEHOLDER        = "Gladyss Nacht"

  ADMIN_OBSERVATION_ALLERGIES_HINT             = "Types or sources of allergic reactions."
  ADMIN_OBSERVATION_ALLERGIES_PLACEHOLDER      = "Fieve de foin"

  ADMIN_OBSERVATION_DIET_HINT                  = "Diet restrictions if any."
  ADMIN_OBSERVATION_DIET_PLACEHOLDER           = "Gluten"

  ADMIN_OBSERVATION_SLEEP_HINT                 = "Types or sources of allergic reactions."
  ADMIN_OBSERVATION_SLEEP_PLACEHOLDER          = "Fieve de foin"

  ADMIN_OBSERVATION_ELIMINATION_HINT           = "Elimination problems or strategy."
  ADMIN_OBSERVATION_ELIMINATION_PLACEHOLDER    = "Normal"

  ADMIN_OBSERVATION_CONCERNS_HINT              = "General concerns for this child."
  ADMIN_OBSERVATION_CONCERNS_PLACEHOLDER       = "..."

  ADMIN_OBSERVATION_STABILITY_HINT             = "General stability of child."
  ADMIN_OBSERVATION_STABILITY_PLACEHOLDER      = "Normal"

#
# Students
#
  ADMIN_STUDENT_NAME_LABEL                     = "Student Name:"
  ADMIN_STUDENT_NAME_HINT                      = "Steif, Teddy"
  ADMIN_STUDENT_NAME_PLACEHOLDER               = "Student name."
  
end
