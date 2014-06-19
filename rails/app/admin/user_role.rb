ActiveAdmin.register UserRole do
  
  permit_params :name

  menu :parent => "role"

  config.filters = false

  index do
    selectable_column
    column :id
    column :name
    column :created_at
    column :updated_at
    actions
  end
  
end
