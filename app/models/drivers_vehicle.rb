class DriversVehicle < ActiveRecord::Base

    belongs_to :driver, :primary_key => 'user_id'
    belongs_to :vehicle

end
