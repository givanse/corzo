ActiveAdmin.register Client do

  active_admin_importable

  menu :parent => "Usuarios" 
  
  index do
    selectable_column                                                            
    #column :name                                                               
    #column :phone_number
    #column :email                                                             

    column :user

    column :location
    actions
  end
end
