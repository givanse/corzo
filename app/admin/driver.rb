ActiveAdmin.register Driver do
  
  menu :parent => "Agentes"
  
  # TODO change to POST
  member_action :set_status, :method => :get do
      #user = User.find(params[:id])
      
      render :json => "{\"repsonse\": \"empty\"}"
  end

end