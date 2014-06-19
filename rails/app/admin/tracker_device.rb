ActiveAdmin.register TrackerDevice do

  menu :parent => "Bienes"  
  
  active_admin_importable

  index do
    selectable_column                                                            
    column :description  
    actions
  end
end
