ActiveAdmin.register Observation do

  # actions :all, :except => [:new, :edit, :show]
  menu label: "Profiles", parent: "Students"
  
  index title: "Individual Profiles" do
    selectable_column

    column "Student (click)" do |obs|
      link_to obs.student.name, admin_student_path(obs.student) unless obs.student_id.nil?
    end

    column "Obs date (click)" do |obs|
      link_to obs.observed_on.strftime("%A, %d %B, %Y"), admin_observation_path(obs)
    end
    column :grade
    column :teacher
    column :allergies
    column :diet
    column :sleep
    column :elimination
    column :stability
    column :concerns

  end  
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
    h2 f.student.name    

    f.inputs "Student Evaluation" do

      f.input :observed_on,
              :required       => true,
              :hint           => AdminConstants::ADMIN_OBSERVATION_DATE_ON_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_DATE_ON_PLACEHOLDER

      f.input :grade,
              :hint           => AdminConstants::ADMIN_OBSERVATION_GRADE_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_GRADE_PLACEHOLDER

      f.input :teacher,
              :hint           => AdminConstants::ADMIN_OBSERVATION_TEACHER_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_TEACHER_PLACEHOLDER

      f.input :allergies,
              :hint           => AdminConstants::ADMIN_OBSERVATION_ALLERGIES_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_ALLERGIES_PLACEHOLDER

      f.input :diet,
              :hint           => AdminConstants::ADMIN_OBSERVATION_DIET_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_DIET_PLACEHOLDER

      f.input :elimination,
              :hint           => AdminConstants::ADMIN_OBSERVATION_ELIMINATION_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_ELIMINATION_PLACEHOLDER

      f.input :concerns,
              :hint           => AdminConstants::ADMIN_OBSERVATION_CONCERNS_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_CONCERNS_PLACEHOLDER

      f.input :stability,
              :hint           => AdminConstants::ADMIN_OBSERVATION_STABILITY_HINT,
              :placeholder    => AdminConstants::ADMIN_OBSERVATION_STABILITY_PLACEHOLDER

    end
    f.actions
  end

  show :title => "Individual Profile" do |dl|
    attributes_table_for(dl) do
      row :student
      row :grade
      row :teacher
      row :allergies
      row :diet
      row :elimination
      row :concerns
      row :stability
    end
    active_admin_comments
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
    permitted = [:permitted, :student_id, :observed_on, :grade, :teacher, :allergies, :diet, 
        :sleep, :elimination, :concerns, :stability, :parent_histories, :household_members, 
        :community_supports, :interaction_patterns, :well_attuned, :avoidant, :vigilant, 
        :over_stimulating, :sensory_registration, :sensory_orientation, :sensory_interpretation, 
        :response_organization, :response_execution, :adaptability, :sensory_threshold, 
        :sensory_seeking_behaviors, :shares_attention, :regulation, :engagement, :interactions, 
        :individuation, :mood, :solves_problems, :imagination, :creativity, :reasoning, 
        :links_emotions, :perspective, :multiCausal_thinking, :selfReflective_thinking,
        :recorder]
    end


end
