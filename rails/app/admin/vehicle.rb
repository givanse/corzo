ActiveAdmin.register Vehicle do
    
  active_admin_importable

  menu :parent => "Inventario"

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
