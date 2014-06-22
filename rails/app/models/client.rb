class Client < ActiveRecord::Base

  self.primary_key = 'user_id'

  belongs_to :location
  belongs_to :user

  def self.get_user_details(user_id)
    Client.where(user_id: user_id)
          .select(:location_id)
          .first
  end

  def to_s                                                                       
    User.select(:name)                                                           
        .where(id: user_id)[0].name                                               
  end

end
