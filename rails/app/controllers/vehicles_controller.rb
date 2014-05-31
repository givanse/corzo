class VehiclesController < ApplicationController

  def get_current_positions
    render :json => "{\"taxisLatLon\":["\
                    "{\"Taxi\":{\"_id\":\"1\",\"driverCellphone\":\"33.0001.0001\",\"lastLatitude\":\"20.672741\",\"lastLongitude\":\"-103.389332\",\"modifiedLocation\":\"on 28\/9\/13\",\"plate\":\"AMJ-0001\",\"status\":1,\"icon_base_name\":\"r.png\"}},"\
                    "{\"Taxi\":{\"_id\":\"2\",\"plate\":\"AMj-0002\",\"lastLatitude\":20.666346,\"lastLongitude\":-103.394598,\"driverCellphone\":\"33.0001.0001\",\"status\":2,\"modifiedLocation\":\"on 28\/10\/13\",\"icon_base_name\":\"r.png\"}},"\
                    "{\"Taxi\":{\"_id\":\"3\",\"plate\":\"AMJ-0003\",\"lastLatitude\":20.666842,\"lastLongitude\":-103.373598,\"driverCellphone\":\"33.0001.0001\",\"status\":3,\"modifiedLocation\":\"on 28\/10\/13\",\"icon_base_name\":\"e.png\"}},"\
                    "{\"Taxi\":{\"_id\":\"4\",\"plate\":\"AMJ-0004\",\"lastLatitude\":20.686742,\"lastLongitude\":-103.393598,\"driverCellphone\":\"33.0001.0001\",\"status\":4,\"modifiedLocation\":\"on 28\/10\/13\",\"icon_base_name\":\"e.png\"}}]}"
  end

end
