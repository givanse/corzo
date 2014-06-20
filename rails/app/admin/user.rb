ActiveAdmin.register User do

  menu :parent => "Usuarios"

  permit_params :user_role_id, :email, :name, :phone_number,
                :password, :password_confirmation

  filter :email
  filter :name
  filter :phone_number
  filter :user_role
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :name
    column :user_role
    column :phone_number
    column :email
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "User" do
      f.input :user_role
      f.input :email
      f.input :name
      f.input :phone_number
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  #sidebar "Users Details", only: [:show, :edit] do
  #  ul do
  #    li link_to("Drivers", admin_user_driver_path(user))
  #  end
  #end

end
