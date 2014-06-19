ActiveAdmin.register DriverVehicleRecord do

  menu :parent => "Bitacoras" 
  
  index do
    selectable_column
    column :driver
    column :vehicle
    column :assigned_at
    actions
  end

  controller do
    # https://github.com/gregbell/active_admin/issues/2390
    def permitted_params
      params.permit post: [:driver_id, :vehicle_id, :assigned_at]
    end
  end

end
