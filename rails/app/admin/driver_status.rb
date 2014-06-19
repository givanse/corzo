ActiveAdmin.register DriverStatus do

  menu :parent => "Categorías"

  config.filters = false                                                         
                                                                                 
  index do                                                                       
    selectable_column                                                            
    column :id                                                                   
    column :name                                                                 
    column :created_at                                                           
    column :updated_at                                                           
    actions                                                              
  end                                                                            
  
end
