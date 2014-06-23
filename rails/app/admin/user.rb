ActiveAdmin.register User do

  menu :label => "Usuarios"

  permit_params :user_role_id, :email, :name, :phone_number,
                :password, :password_confirmation

  active_admin_importable

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

    user_role_name = user.user_role.name.capitalize
    user_details = nil
    case user.user_role_id 
    when 0
      user_details = Client.get_user_details user.id 
    when 1
      user_details = Driver.get_user_details user.id
    when 2
      # user_details = Operator.find user.id 
    when 3
      # user_details = Owner.find user.id 
    else
      user_role_name = 'error: no template for this user role'
    end

    panel "Role: " + user_role_name do
      if user_details    
        attributes_table_for user_details do
          attributes = user_details.attributes.except('user_id')
          attributes.each do |attr_name, attr_value|
            row attr_name
          end
        end
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
