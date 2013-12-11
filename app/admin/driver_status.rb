ActiveAdmin.register DriverStatus do

  menu :parent => "Categorias" # TODO: add accent

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
