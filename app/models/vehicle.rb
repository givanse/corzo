class Vehicle < ActiveRecord::Base

  belongs_to :tracker_device
  belongs_to :vehicle_role

  def to_s
    model + ' ' + year.to_s + ' ' + plate
  end
end
