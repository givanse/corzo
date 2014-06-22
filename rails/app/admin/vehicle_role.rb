ActiveAdmin.register VehicleRole do

  permit_params :name

  menu false
  menu :parent => "Role"
  
end
