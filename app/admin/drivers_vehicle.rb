ActiveAdmin.register DriversVehicle do

  menu :parent => "Bitacoras" 
  
  controller do
    # https://github.com/gregbell/active_admin/issues/2390
    def permitted_params
      params.permit post: [:driver_id, :vehicle_id, :assigned_at]
    end
  end

end
