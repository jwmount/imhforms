ActiveAdmin.register DevelopmentalLevel do
  belongs_to :student
  navigation_menu "Stage 1"

  # if an action is defined but not implemented you get 'Action Not Found'
  #actions :except => [:show]

  index title: "Development Level Assesements" do
    h2 "#{student.name}"

    selectable_column

=begin
    column "Student (click)" do |dl|
      link_to dl.student.name, admin_student_path(dl.student)
    end
=end
    column "Details (click)" do |developmental_level|
      #link_to "#{developmental_level.observed_on.strftime("%A, %d %B, %Y")}", admin_student_developmental_level_path( developmental_level.student, developmental_level )
      link_to "Details", edit_admin_student_developmental_level_path( student, developmental_level)
    end
    
    column :recorder
    column :observed_on
    column :duration
    
    # Use collections with option_tags, the tags get stored in the database
    column :facilitated_by_adult,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options

    column :initiated_by_child,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :sensory_motor,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :pleasure,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :displeasure,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :with_object,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options

#   Page 2

    column :sensory_motor_play,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :representational_play,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :with_adult_support,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :independently,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :cross_context_1,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :cross_context_2,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :cross_context_3,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options
    column :cross_context_4,
           :as            => :select,
           :include_blank => true,
           :collection    => developmental_level_options


  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    
    h2 f.student.name

    f.inputs "Shared Attention & Self Regulation with Adult" do

      f.input :observed_on, 
              :value          => '12-1-2014',
              :required       => true, 
              :label          => AdminConstants::ADMIN_OBSERVATION_DATE_ON_LABEL, 
              :hint           => AdminConstants::ADMIN_OBSERVATION_DATE_ON_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_DATE_ON_PLACEHOLDER

      f.input :recorder, 
              :required       => true, 
              :label          => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_RECORDER_LABEL, 
              :hint           => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_RECORDER_HINT,
              :placeholder    => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_RECORDER_PLACEHOLDER

      f.input :duration, 
              :required       => true, 
              :label          => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_DURATION_LABEL, 
              :hint           => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_DURATION_HINT,
              :placeholder    => AdminConstants::ADMIN_DEVELOPMENT_LEVEL_DURATION_PLACEHOLDER

      f.input :facilitated_by_adult, 
              :as => :radio,
              :include_blank => true,
              :collection    => developmental_level_options

      f.input :facilitated_by_adult, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :initiated_by_child, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :sensory_motor, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :pleasure, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :displeasure, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :with_object, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
    end

    f.inputs "Shared Attention & Self Regulation with Peer(s) in a Group" do

      f.input :sensory_motor_play, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :representational_play, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :with_adult_support, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :independently, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options              
      f.input :cross_context_1, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :cross_context_2, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :cross_context_3, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
      f.input :cross_context_4, 
              :as => :select,
              :include_blank => true,
              :collection    => developmental_level_options
    end    

    f.actions
  end
  
show :title => "Developmental Levels" do |dl|

  h2 dl.student.name

  attributes_table_for(dl) do
    row :observed_on
    row :recorder
    row :duration

    row ( "Facilitated by adult") do |dl|
      developmental_level_options[ dl.facilitated_by_adult ][0]
    end
    
    row ( "Initiated by child" ) do |dl|
      developmental_level_options[ dl.initiated_by_child ][0]
    end

    row ( "Sensory motor" ) do |dl|
      developmental_level_options[ dl.sensory_motor ][0]
    end

    row ( "Pleasure" ) do |dl|
      developmental_level_options[ dl.pleasure ][0]
    end

    row ( "Displeasure" ) do |dl|
      developmental_level_options[ dl.displeasure ][0]
    end

    row ("With object") do |dl|
      developmental_level_options[ dl.with_object ][0]
    end

#   Page 2

    row ("Sensory motor play") do |dl|
      developmental_level_options[ dl.sensory_motor_play ][0]
    end
    row ("Representational play") do |dl|
      developmental_level_options[ dl.representational_play ][0]
    end
    row ("With adult support") do |dl|
      developmental_level_options[ dl.with_adult_support ][0]
    end
    row ("Independently") do |dl|
      developmental_level_options[ dl.independently ][0]
    end
    row ("Across Contexts A1") do |dl|
      developmental_level_options[ dl.cross_context_1 ][0]
    end
    row ("Across Contexts 2") do |dl|
      developmental_level_options[ dl.cross_context_2 ][0]
    end
    row ("Across Contexts 3") do |dl|
      developmental_level_options[ dl.cross_context_3 ][0]
    end
    row ("Across Contexts 4") do |dl|
      developmental_level_options[ dl.cross_context_4 ][0]
    end

  end
  active_admin_comments
end


  batch_action :compare do |selection|
      # Do some deleting...
      # selection.destroy
    logger.info("*_*_*_*_*_ Do a compare page #{selection}") 
    @selections = DevelopmentalLevel.find(selection)
    flash[:warning] = 'Comparisons...'
    redirect_to admin_developmental_levels_path(@selections)
  end


#
# P E R M I T T E D  P A R A M E T E R S
#

  permit_params do
   permitted = [:permitted, :student_id, :observed_on, :recorder, 
    :facilitated_by_adult, :initiated_by_child, 
    :sensory_motor, :pleasure, :displeasure, :with_object,
    :duration,
    :sensory_motor_play, :representational_play, :with_adult_support,
    :independently, :cross_context_1, :cross_context_2, :cross_context_3, :cross_context_4
    ]
  end #permit_params
  
end
