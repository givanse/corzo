class ServicesController < ApplicationController

  def get_forthcoming
    render :json => "{\"services\":[{\"Service\":{\"_id\":\"52753066fde32e58bce4f8f6\",\"address\":\"Paseo loma larga\",\"scheduled\":\"Tue, Jan 29th 2013, 14:30\"}},{\"Service\":{\"_id\":\"52753066fde32e58bce4f8f7\",\"address\":\"Av. Vallarta\",\"scheduled\":\"Sun, Dec 29th 2013, 14:30\"}}]}"
  end

end
