class MonitorController < ApplicationController

  layout 'monitor'
    
  def index
    flash[:notice] = "Aviso: El Servicio ha sido registrado o cancelado!"
  end

end
