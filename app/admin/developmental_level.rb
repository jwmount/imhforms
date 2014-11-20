ActiveAdmin.register DevelopmentalLevel do
  belongs_to :student
  navigation_menu :project
  
  # if an action is defined but not implemented you get 'Action Not Found'
  # actions :all, :except => [:show]

  index title: "Development Levels for #{:student}" do

    selectable_column
    
    column :student
    column :date_on
    column :recorder
    column "Facilitated By Adult" do |dl|
      s  = dl.fba_not_present == "" ? '.' : 'np'
      s += dl.fba_fleeting    == "" ? '.' : 'f'
      s += dl.fba_constricted == "" ? '.' : 'np'
      s += dl.fba_stable      == "" ? '.' : 's'
    end
    column "Initiated By Child" do |dl|
      s  = dl.ibc_not_present == "" ? '.' : 'np'
      s += dl.ibc_fleeting    == "" ? '.' : 'f'
      s += dl.ibc_constricted == "" ? '.' : 'np'
      s += dl.ibc_stable      == "" ? '.' : 's'
    end
    column "Sensory Motor" do |dl|
      s  = dl.sm_not_present == "" ? '.' : 'np'
      s += dl.sm_fleeting    == "" ? '.' : 'f'
      s += dl.sm_constricted == "" ? '.' : 'np'
      s += dl.sm_stable      == "" ? '.' : 's'
    end
    column "Pleasure" do |dl|
      s  = dl.p_not_present == "" ? '.' : 'np'
      s += dl.p_fleeting    == "" ? '.' : 'f'
      s += dl.p_constricted == "" ? '.' : 'np'
      s += dl.p_stable      == "" ? '.' : 's'
    end      
    column "Displeasure" do |dl|
      s  = dl.p_not_present == "" ? '.' : 'np'
      s += dl.p_fleeting    == "" ? '.' : 'f'
      s += dl.p_constricted == "" ? '.' : 'np'
      s += dl.p_stable      == "" ? '.' : 's'
    end      
    column "With Object" do |dl|
      s  = dl.p_not_present == "" ? '.' : 'np'
      s += dl.p_fleeting    == "" ? '.' : 'f'
      s += dl.p_constricted == "" ? '.' : 'np'
      s += dl.p_stable      == "" ? '.' : 's'
    end      
    column :duration
  end

  form do |f|
    
    f.inputs "Administration" do

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
   permitted = [:permitted, :student_id, :date_on, :recorder, :fba_not_present, :fba_fleeting, :fba_constricted,
    :fba_stable, :ibc_not_present, :ibc_fleeting, :ibc_constricted, :ibc_stable, 
    :sm_not_present, :sm_fleeting, :sm_constricted, :sm_stable, 
    :p_not_present, :p_fleeting, :p_constricted, :p_stable, 
    :d_not_present, :d_fleeting, :d_constricted, :d_stable, 
    :wo_not_present, :wo_fleeting, :wo_constricted, :wo_stable, 
    :duration
    ]
end

end
