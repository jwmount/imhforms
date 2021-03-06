#require 'debugger'
ActiveAdmin.register Student do

  #actions :all, :except => [:new, :edit, :show]

  filter :name
  filter :born_on


  index title: "Student list" do

    selectable_column

    column "Progress Summary(click)" do |student|
      if student.developmental_levels.empty?
        flash[:Note] = "No developmental_levels have been recorded yet."
      else
        link_to student.name, admin_student_path(student)
      end
    end

    column "Developmental Levels (click)" do |student|
      link_to "Assements", admin_student_developmental_levels_path(student) 
    end

  end #index

  show do
    enrollment = student.developmental_levels.minimum("observed_on")
    today = student.developmental_levels.maximum("observed_on")
    h2 "Stage 1 Progress Summary"
    h4 "Assessement history from #{enrollment.strftime(" %b %d, %Y")}, thru #{today.strftime(" %b %d, %Y")} " +
       "(0 means none given)"
    h3 link_to "All assements for #{student.name}", admin_student_developmental_levels_path(student) 
    render partial: 'progress', object: @student
  end #show


# 
# P U S H  B U T T O N S
#
  # ACTIVATE
  # Activate sets the company status to Active (true).  Does not toggle.
  # 
  
  action_item :only => [:edit, :show] do 
    link_to 'Evaluation Detail', admin_student_evaluation_detail_path(student)
  end

  member_action :evaluation_detail, :method => :get do
    student = Student.find(params[:id])
    redirect_to admin_evaluation_detail_path(student)
  end


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
