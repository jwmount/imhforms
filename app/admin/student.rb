ActiveAdmin.register Student do

  #actions :all, :except => [:new, :edit, :show]

  index do
    selectable_column

    column do |student|
      link_to student.name, admin_student_path(student)
    end

    column "Birth date" do |student|
      student.born_on.strftime("%A, %d %B, %Y")
    end
    column "Developmental Levels" do |student|
      link_to "Observations", admin_student_developmental_levels_path(student) 
    end

  end  

  show do
    h2 "Stage 1 Progress Summary"
    #@dls = student.developmental_levels
    #render @dls #will pass in each instance
    render partial: 'progress', object: @student
end


# 
# P U S H  B U T T O N S
#
  # APPROVE
  # Approve sets BOTH types of approval for now.  Elaborate later.
  # Aside from the obvious need to do one or the other and perhaps toggle them
  # this operation should be silently logged for audit purposes.
  collection_action :developmental_levels, :method => :post do
    link_to 'Developmental Levels', admin_developmental_levels_path #approve_admin_quote_solution_path( quote, solution )
  end

=begin
  member_action :approve, :method => :get do
    @solution = Solution.find(params[:id])
    @solution.client_approved = true
    @solution.approved = true
    @solution.save
    flash[:notice] = "Solution was approved."
    redirect_to admin_quote_solution_path(@solution.quote, @solution)
  end
=end

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
