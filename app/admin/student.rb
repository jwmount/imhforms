ActiveAdmin.register Student do

  #actions :all, :except => [:new, :edit, :show]

  filter :name
  filter :born_on

  index title: "Student list" do

    selectable_column

#    column "Profile(click)" do |student|
#      link_to student.name, admin_student_observations_path(student) unless student.observations.empty?
#    end

    column "Progress Summary(click)" do |student|
      link_to student.name, admin_student_path(student)
    end

    column "Developmental Levels (click)" do |student|
      link_to "Assements", admin_student_developmental_levels_path(student) 
    end

  end #index

  show do
    h2 "Stage 1 Progress Summary"
    render partial: 'progress', object: @student
  end #show


# 
# P U S H  B U T T O N S
#


  # --------------------------------------------------------------------------------------------------------------------
  
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

  # Currently we do not permit changes to imported data of any kind.
  permit_params do
    permitted = [:permitted, :name, :born_on]
    end

end
