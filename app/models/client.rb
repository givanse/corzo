class Client < ActiveRecord::Base

  #self.primary_key = 'user_id'

  belongs_to :user
  belongs_to :tservice_location_orig, :class_name => 'TransportServiceLocation'

  def to_s                                                                       
    User.select(:name)                                                           
        .where(id: user_id)[0].name                                               
  end

end
