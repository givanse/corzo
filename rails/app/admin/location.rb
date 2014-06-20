ActiveAdmin.register Location do

 menu :parent => "Servicios"  

 permit_params :comments, :latitude, :longitude, :address  

 index do
   selectable_column   
   column :address
   column :comments
   column :latitude   
   column :longitude
   actions
 end
end
