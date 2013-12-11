ActiveAdmin.register Service do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  index do                                                                       
    selectable_column                                                            
    column :id                                                                   
    column :address                                                                 
    column :suburb
    column :schedule_at
    column :created_at                                                           
    column :updated_at                                                           
    default_actions                                                              
  end

end
