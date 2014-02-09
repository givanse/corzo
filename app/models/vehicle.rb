class Vehicle < ActiveRecord::Base

  belongs_to :tracker_device

  def to_s
    model + ' ' + year.to_s + ' ' + plate
  end
end
