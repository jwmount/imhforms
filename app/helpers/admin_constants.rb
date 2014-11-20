# If these values are changed, re-run migrations or reload schema
# $ bundle exec rake db:drop db:create db:schema:load db:seed
# Internationalization, see http://stackoverflow.com/questions/3629894/internationalization-for-constants-hashes-in-rails-3
module AdminConstants

#
# Development_Levels
#
  ADMIN_DEVELOPMENT_LEVEL_DATE_ON_LABEL       = "Date observed:" 
  ADMIN_DEVELOPMENT_LEVEL_DATE_ON_HINT        = "Date when the behavior was seen."
  ADMIN_DEVELOPMENT_LEVEL_DATE_ON_PLACEHOLDER = "mm-dd-yyyy"

  ADMIN_DEVELOPMENT_LEVEL_RECORDER_LABEL       = "Recorded by:"
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_HINT        = "Person who entered this observation."
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_PLACEHOLDER = "name"
  
  ADMIN_DEVELOPMENT_LEVEL_DURATION_LABEL       = "Duration observed, minutes" 
  ADMIN_DEVELOPMENT_LEVEL_DURATION_HINT        = "How long the child exhibited this behavior."
  ADMIN_DEVELOPMENT_LEVEL_DURATION_PLACEHOLDER = "minutes"

  ADMIN_DEVELOPMENT_LEVEL_NOT_PRESENT_LABEL    = "Not present"
  ADMIN_DEVELOPMENT_LEVEL_FLEETING_LABEL       = "Fleeting"
  ADMIN_DEVELOPMENT_LEVEL_CONSTRICTED_LABEL    = "Constricted"
  ADMIN_DEVELOPMENT_LEVEL_STABLE_LABEL         = "Stable"

end
