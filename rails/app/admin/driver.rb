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

  # TODO change to POST
  member_action :set_status, :method => :get do
      #user = User.find(params[:id])
      render :json => "{\"repsonse\": \"empty\"}"
  end

end
