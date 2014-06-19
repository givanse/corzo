class Driver < ActiveRecord::Base

  #self.primary_key = 'user_id'

  belongs_to :driver_status
  belongs_to :tracker_device
  belongs_to :user

  def to_s
    User.select(:name)                                              
        .where(id: user_id)[0].name
  end

end
