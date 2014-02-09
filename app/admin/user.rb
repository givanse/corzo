ActiveAdmin.register User do

  menu :parent => "Usuarios"

  filter :email
  filter :name
  filter :phone_number
  filter :role_id
  filter :created_at                                                           
  filter :updated_at                                                           

  index do                                                                       
    selectable_column                                                            
    column :id                                                                   
    column :email                                                             
    column :name                                                               
    column :role_id                                                          
    column :created_at                                                           
    column :updated_at                                                           
    default_actions                                                              
  end 
  
end
