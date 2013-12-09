class Driver < ActiveRecord::Base
  belongs_to :user
  belongs_to :driver_status
  has_one :vehicle
end
