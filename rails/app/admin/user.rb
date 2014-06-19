ActiveAdmin.register User do

  menu :parent => "Usuarios"

  filter :email
  filter :name
  filter :phone_number
  filter :role
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :name
    column :role
    column :phone_number
    column :email
    actions
  end

  #sidebar "Users Details", only: [:show, :edit] do
  #  ul do
  #    li link_to("Drivers", admin_user_driver_path(user))
  #  end
  #end

end
