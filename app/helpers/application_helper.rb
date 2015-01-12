module ApplicationHelper

  # A panel will be rendered for each of these behaviors.  These MUST match :attribute method
  # names in DevelopmentalLevels.
  def behaviors
    ['facilitated_by_adult', 'initiated_by_child', 'sensory_motor', 'pleasure',
      'displeasure', 'with_object', 'sensory_motor_play', 'representational_play',
      'with_adult_support', 'independently', 'cross_context_1', 'cross_context_2',
      'cross_context_3', 'cross_context_4']
  end

  def developmental_level_options
  	[ ['Not recorded',0], ['Not Present',1], ['Fleeting',2], ['Constricted',3], ['Stable',4] ]
  end

  # Find average values for all behaviors for all students by date.  Should be a progression.
  def overall behavior, date_range
    ans = DevelopmentalLevel.where(date_range.include?(:observed_on)).average("#{behavior}")
    ans.to_f.round(2)
  end #overall


    # Date intervals (buckets), every 15 days beginning 1 Nov 2014
    # Work out how to inject the dates or something and don't issue any beyond max observe_on
    # If @buckets exists just return it as will be same for given student.
    def date_buckets
      return( @dates ||= 
        @dates = Array.new()
        @dates = [Range.new(Date.today-75.days, Date.today-60.days),
               Range.new(Date.today-60.days, Date.today-45.days),
               Range.new(Date.today-45.days, Date.today-30.days), 
               Range.new(Date.today-30.days, Date.today-15.days), 
               Range.new(Date.today-15.days, Date.today)
             ]
          )
    end

end
