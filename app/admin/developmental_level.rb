ActiveAdmin.register DevelopmentalLevel do

  actions :all, :except => [:new, :edit, :show]

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

  index do

    selectable_column

    column :date_on
    column :recorder
    column :fba_not_present
    column :fba_fleeting
    column :fba_constricted
    column :fba_stable
    column :ibc_not_present, :ibc_fleeting, :ibc_constricted, :ibc_stable, 
    :sm_not_present, :sm_fleeting, :sm_constricted, :sm_stable, 
    :p_not_present, :p_fleeting, :p_constricted, :p_stable, 
    :d_not_present, :d_fleeting, :d_constricted, :d_stable, 
    :wo_not_present, :wo_fleeting, :wo_constricted, :wo_stable, 
    :duration
  end
=begin
  form do |f|
    #error_panel f

    f.inputs "Details" do

        f.input :date_on, 
              :as => :date_picker,              
              :hint => "Date of observation."  
    end      
    f.actions
  end
=end

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
