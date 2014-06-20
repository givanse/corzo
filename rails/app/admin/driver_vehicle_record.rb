ActiveAdmin.register DriverVehicleRecord do

  menu :parent => "Bitacoras" 
  
  permit_params :driver_id, :vehicle_id, :assigned_at

  index do
    selectable_column
    column :driver
    column :vehicle
    column :assigned_at
    actions
  end

end
