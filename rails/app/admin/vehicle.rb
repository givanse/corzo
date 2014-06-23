ActiveAdmin.register Vehicle do

  menu :parent => "Inventario", :label => "Vehiculos"

  active_admin_importable

  permit_params :tracker_device_id, :vehicle_role_id, :model, :plate, :year

  actions :all, :except => [:destroy]

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
