ActiveAdmin.register Location do

 menu :parent => "Inventario", :priority => 100  

 active_admin_importable

 permit_params :comments, :latitude, :longitude, :address  

 actions :all, :except => [:destroy]

 index do
   selectable_column   
   column :address
   column :comments
   column :latitude   
   column :longitude
   actions
 end
end
