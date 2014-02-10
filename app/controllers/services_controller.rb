class ServicesController < ApplicationController

  def get_forthcoming
    render :json => "{\"services\":[{\"Service\":{\"_id\":\"def8f6\",\"address\":\"Paseo loma larga\",\"scheduled\":\"Tue, Jan 29th 2015, 14:30\"}},{\"Service\":{\"_id\":\"e4f8f7\",\"address\":\"Av. Vallarta\",\"scheduled\":\"Sun, Dec 29th 2015, 14:30\"}}]}"
  end

end
