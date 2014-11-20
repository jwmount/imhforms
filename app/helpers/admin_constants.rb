# If these values are changed, re-run migrations or reload schema
# $ bundle exec rake db:drop db:create db:schema:load db:seed
# Internationalization, see http://stackoverflow.com/questions/3629894/internationalization-for-constants-hashes-in-rails-3
module AdminConstants

#
# Development_Levels
#
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_LABEL       = "Recorded By:"
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_HINT        = "Person who entered this observation."
  ADMIN_DEVELOPMENT_LEVEL_RECORDER_PLACEHOLDER = "name"
  
  ADMIN_DEVELOPMENT_LEVEL_DURATION_LABEL       = "Duration observed, seconds" 
  ADMIN_DEVELOPMENT_LEVEL_DURATION_HINT        = "How long the child exhibited this behavior."
  ADMIN_DEVELOPMENT_LEVEL_DURATION_PLACEHOLDER = "minutes"

end
