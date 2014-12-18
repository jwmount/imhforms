ActiveAdmin.register DevelopmentalLevel do
  belongs_to :student
  navigation_menu "Stage 1"

  # if an action is defined but not implemented you get 'Action Not Found'
  #actions :except => [:show]

  index title: "Development Levels for students" do

    selectable_column

    column "Student (click)" do |dl|
      link_to dl.student.name, admin_student_path(dl.student)
    end

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

  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    
    f.inputs "Shared Attention & Regulation with Adult" do

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
    f.actions
  end
  
show :title => "Developmental Levels" do |dl|
  attributes_table_for(dl) do
    row :observed_on
    row :recorder

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

# See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params do
   permitted = [:permitted, :student_id, :observed_on, :recorder, 
    :facilitated_by_adult, :initiated_by_child, 
    :sensory_motor, :pleasure, :displeasure, :with_object,
    :duration
    ]
end

end
