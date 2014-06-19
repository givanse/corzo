class TransportService < ActiveRecord::Base
  belongs_to :tservice_location_orig, :class_name => 'Location'
  belongs_to :tservice_location_dest, :class_name => 'Location'
  belongs_to :client
  belongs_to :driver
end
