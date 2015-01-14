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
  # ans = DevelopmentalLevel.where(date_range.include?(:observed_on)).average("#{behavior}") does NOT work.
  def overall behavior, date_range
    ans = DevelopmentalLevel.where("observed_on >= ? and observed_on <= ?", date_range.min, date_range.max).average("#{behavior}")
    ans.to_f.round(2)
  end #overall

    # In this version @buckets is an array of ranges, i.e. @buckets[0] = range(first, last)
    # Each month has two ranges, namely 1 - 15 and 16 - end.
    # Reference:  Date Class Ruby
    # TODO -- last bucket can be/is one period in future, don't need to show this.
    # TODO -- This version is same as the one in evalutation_details.rb except that one scopes to @student.  Not DRY, should be.
    def date_buckets
      min, max = Date.new()
      @buckets = []
      min = DevelopmentalLevel.minimum("observed_on")
      max = DevelopmentalLevel.maximum("observed_on")

      @buckets = [Range.new( Date.new(min.year, min.month, 1), Date.new(min.year, min.month, 15))]

      # still have to get last day of first month to complete range for second half of first month
      first_day = min + 1.month
      last_day =  first_day - 1.day
      @buckets << Range.new( Date.new(min.year, min.month, 16), Date.new(min.year, min.month, last_day.day ))

      # now based on period.min we get the first element of @buckets which is itself a range
      until @buckets.last.max > max do 
        first_day = @buckets.last.max + 1.day
        mid = Date.new(first_day.year, first_day.month, 15)
        last_day =  first_day + 1.month - 1
        @buckets << Range.new( first_day, mid )
        @buckets << Range.new( mid + 1.day, last_day)
      end
      @buckets
    end

    # Date intervals (buckets), every 15 days beginning 1 Nov 2014
    # Work out how to inject the dates or something and don't issue any beyond max observe_on
    # If @buckets exists just return it as will be same for given student.
    def XXdate_buckets
      return( @dates ||= 
        @dates = Array.new()
        @dates = [Range.new(Date.new(2014, 11, 1), Date.new(2014, 11, 15)),
               Range.new(Date.today-60.days, Date.today-45.days),
               Range.new(Date.today-45.days, Date.today-30.days), 
               Range.new(Date.today-30.days, Date.today-15.days), 
               Range.new(Date.today-15.days, Date.today)
             ]
          )
    end

end
