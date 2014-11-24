ActiveAdmin.register DevelopmentalLevel do
  belongs_to :student
  navigation_menu :project
  
  # if an action is defined but not implemented you get 'Action Not Found'
  # actions :all, :except => [:show]

  index title: "Development Levels for #{:student}" do

    selectable_column

    column "Details (click)" do |developmental_level|
      link_to "#{developmental_level.observed_on.strftime("%A, %d %B, %Y")}", admin_student_developmental_level_path( developmental_level.student, developmental_level )
    end    
    column :recorder
    column :duration
    
    column "Facilitated By Adult" do |dl|
      sum =  dl.fba_not_present ? 0 : 1
      sum += dl.fba_fleeting ? 0 : 1
      sum += dl.fba_constricted ? 0 : 1
      sum += dl.fba_stable ? 0 : 1
    end

    column "Initiated By Child" do |dl|
      sum =  dl.ibc_not_present  ? 0 : 1
      sum += dl.ibc_fleeting     ? 0 : 1
      sum += dl.ibc_constricted  ? 0 : 1
      sum += dl.ibc_stable       ? 0 : 1
    end
    column "Sensory Motor" do |dl|
      s  = dl.sm_not_present  ? 0 : 1
      s += dl.sm_fleeting     ? 0 : 1
      s += dl.sm_constricted  ? 0 : 1
      s += dl.sm_stable       ? 0 : 1
    end
    column "Pleasure" do |dl|
      s  = dl.p_not_present  ? 0 : 1
      s += dl.p_fleeting     ? 0 : 1
      s += dl.p_constricted  ? 0 : 1
      s += dl.p_stable       ? 0 : 1
    end      
    column "Displeasure" do |dl|
      s  = dl.p_not_present  ? 0 : 1
      s += dl.p_fleeting     ? 0 : 1
      s += dl.p_constricted  ? 0 : 1
      s += dl.p_stable       ? 0 : 1
    end      
    column "With Object" do |dl|
      s  = dl.p_not_present  ? 0 : 1
      s += dl.p_fleeting     ? 0 : 1
      s += dl.p_constricted  ? 0 : 1
      s += dl.p_stable       ? 0 : 1
    end      
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    
    f.inputs "Shared Attention & REgulation with Adult" do

      f.input :observed_on, 
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

    end

    f.inputs "Facilitated by Adult" do

      f.input :fba_not_present, 
              :as => :radio,
              :required       => true, 
              :label          => AdminConstants::ADMIN_NOT_PRESENT_LABEL 
      f.input :fba_fleeting,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_FLEETING_LABEL
      f.input :fba_constricted,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_CONSTRICTED_LABEL
      f.input :fba_stable,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_STABLE_LABEL
    end

    f.inputs "Shared Attention & Self Regualation with Peers in a Group" do

      f.input :ibc_not_present, 
              :as => :radio,
              :required       => true, 
              :label          => AdminConstants::ADMIN_NOT_PRESENT_LABEL
      f.input :ibc_fleeting,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_FLEETING_LABEL
      f.input :ibc_constricted,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_CONSTRICTED_LABEL
      f.input :ibc_stable,
              :as => :radio,
              :required       => true,
              :label          => AdminConstants::ADMIN_STABLE_LABEL

    end

    f.inputs "Shared Attention & Self Regualation with Peers in a Group" do
    end

    f.inputs "Engagement (Increasingly Sustained" do
    end

    f.inputs "Engagement (Within a Wider Range of Emotions)" do
    end

    f.inputs "Two-Way Purposeful Interactions" do
    end

    f.inputs "Complex Problem Solving" do
    end

    f.inputs "Creates Emotional Ideas" do
    end

    f.inputs "Builds Bridges Between Ideas -- (Abstract Thinking)" do
    end

    f.actions
  end
  

=begin
show :title => "Observations for" do |developmental_level|
    attributes_table_for(developmental_level) do
      row :date_on
      row :recorder
      row ("FBA") do |developmental_level|
        '1'
      #row ("Equipment") do |schedule|
      #  schedule.job.solution.equipment_name
      end
    end
    active_admin_comments
  end
=end

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
   permitted = [:permitted, :student_id, :observed_on, :recorder, :fba_not_present, :fba_fleeting, :fba_constricted,
    :fba_stable, :ibc_not_present, :ibc_fleeting, :ibc_constricted, :ibc_stable, 
    :sm_not_present, :sm_fleeting, :sm_constricted, :sm_stable, 
    :p_not_present, :p_fleeting, :p_constricted, :p_stable, 
    :d_not_present, :d_fleeting, :d_constricted, :d_stable, 
    :wo_not_present, :wo_fleeting, :wo_constricted, :wo_stable, 
    :duration
    ]
end

end
