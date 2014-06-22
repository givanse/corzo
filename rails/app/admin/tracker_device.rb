ActiveAdmin.register TrackerDevice do

  menu :parent => "Inventario", :label => "Dispositivos GPS" 

  permit_params :model, :UDID, :IMEI
 
  active_admin_importable

  index do
    selectable_column                                                            
    column :model
    column :UDID
    column :IMEI
    actions
  end
end
