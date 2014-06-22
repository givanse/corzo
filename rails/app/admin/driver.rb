ActiveAdmin.register Driver do

  #menu :parent => "Usuarios"
  menu false

  active_admin_importable

  index do
    selectable_column
    #column :name
    #column :phone_number
    #column :email

    column :user

    column :license
    column :cellphone
    column :tracker_device
    column :driver_status
    actions
  end

  show do
    panel I18n.t('views.user.show.title') do
      user = User.find params[:id]
      attributes_table_for user do
        row :id
        row :email
        row :name
      end
    end
    panel I18n.t('views.client.show.title') do
      attributes_table_for driver do
        row :cellphone
        row :driver_status
        row :license
        row :tracker_device
      end
    end
  end

  # TODO change to POST
  member_action :set_status, :method => :get do
      #user = User.find(params[:id])
      render :json => "{\"repsonse\": \"empty\"}"
  end

end
