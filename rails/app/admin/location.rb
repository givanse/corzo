ActiveAdmin.register Location do

 menu :parent => "Servicios"  
  
 index do
   selectable_column   
   column :address
   column :comments
   column :latitude   
   column :longitude
   actions
 end
end
