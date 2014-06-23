ActiveAdmin.register TransportService do

  config.clear_action_items!
 
  permit_params :client_id, :client_name, :comments, :fare, :driver_id, 
                :schedule_at, 
                :tservice_location_orig_id, :tservice_location_dest_id 

  actions :all, :except => [:destroy]

  index do
    selectable_column
    column :client_name

    column :driver
    column :client

    column :fare
    column :schedule_at
    column :comments
    actions
  end

end
