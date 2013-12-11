ActiveAdmin.register DriverStatus do

  
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

  config.filters = false                                                         
                                                                                 
  index do                                                                       
    selectable_column                                                            
    column :id                                                                   
    column :name                                                                 
    column :created_at                                                           
    column :updated_at                                                           
    default_actions                                                              
  end                                                                            
                                                                                 
  index :as => :grid, :default => true do |driver_status|                                 
    div do                                                                       
      b do                                                                       
        link_to(driver_status.name.upcase, admin_driver_status_path(driver_status))                         
      end                                                                        
    end                                                                          
  end
  
end
