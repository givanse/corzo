ActiveAdmin.register TransportService do
  
  menu :parent => "Servicios"

  config.clear_action_items!

  index do
    selectable_column
    column :client_name

    column :driver
    column :client

    column :fare
    column :schedule_at
    actions
  end

end