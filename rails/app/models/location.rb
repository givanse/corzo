class Location < ActiveRecord::Base

  def to_s
    if address
      address.to_s
    else
      latitude.to_s + ', ' + longitude.to_s
    end
  end

end
