ActiveAdmin.register TransportService do
  
  menu :parent => "Servicios"

  index do
    selectable_column
    column :id
    column :client_id
    column :client_name
    column :fare
    column :driver_id
    column :schedule_at
    column :created_at
    column :updated_at
    default_actions
  end

end
