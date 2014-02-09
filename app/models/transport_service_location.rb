class TransportServiceLocation < ActiveRecord::Base

    def to_s
        '(' + latitude.to_s + ', ' + longitude.to_s + ') ' + address.to_s
    end

end
