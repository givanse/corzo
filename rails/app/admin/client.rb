ActiveAdmin.register Client do

  active_admin_importable

  #menu :parent => "Usuarios" 
  menu false
  
  index do
    selectable_column                                                            
    #column :name                                                               
    #column :phone_number
    #column :email                                                             

    column :user

    column :location
    actions
  end

  controller do
    def show
      redirect_to admin_user_path
    end
  end

end
