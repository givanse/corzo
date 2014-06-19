class Location < ActiveRecord::Base

    def to_s
      address.to_s
    end

end
