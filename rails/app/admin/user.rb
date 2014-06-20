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

  show :title => :name do |ad|
    panel I18n.t('views.user.show.title') do
      attributes_table_for user do
        row :id
        row :email
        row :name
        row :user_role
        row :phone_number
        row :active
        row :created_at
        row :update_at
      end
    end

    panel I18n.t('views.user.show.sign_in') do
      attributes_table_for user do
        row :sign_in_count
        row :current_sign_in_at
        row :last_sign_in_at
        row :current_sign_in_ip
        row :last_sign_in_ip
      end
    end

    panel I18n.t('views.user.show.remember') do
      attributes_table_for user do
        row :remember_created_at
        row :remember_password_sent_at
      end
    end
  end

  #sidebar "Users Details", only: [:show, :edit] do
  #  ul do
  #    li link_to("Drivers", admin_user_driver_path(user))
  #  end
  #end

end
