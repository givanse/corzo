ActiveAdmin.register VehicleRole do

  permit_params :name

  menu :parent => "Role"
  
end
