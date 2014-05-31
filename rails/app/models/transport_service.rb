class TransportService < ActiveRecord::Base
    belongs_to :tservice_location_orig, :class_name => 'TransportServiceLocation'
    belongs_to :tservice_location_dest, :class_name => 'TransportServiceLocation'
end
