class Driver < ActiveRecord::Base

  self.primary_key = 'user_id'

  belongs_to :driver_status
  belongs_to :tracker_device
  belongs_to :user

  def self.get_user_details(user_id)
    Driver.where(user_id: user_id)
          .select(:cellphone, :driver_status_id, :license, :tracker_device_id)
          .first
  end

  def to_s
    User.select(:name)                                              
        .where(id: user_id)[0].name
  end

end
