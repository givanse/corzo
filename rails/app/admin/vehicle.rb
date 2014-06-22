ActiveAdmin.register Vehicle do
    
  active_admin_importable

  menu :parent => "Inventario", :label => "Vehiculos"

  permit_params :tracker_device_id, :vehicle_role_id, :model, :plate, :year

  index do
    selectable_column
      column :model
      column :plate
      column :vehicle_role
      column :tracker_device
      column :year
    actions
  end

end
