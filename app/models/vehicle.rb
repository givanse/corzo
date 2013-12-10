class Vehicle < ActiveRecord::Base
  belongs_to :driver

  def to_s
    model + ' ' + year.to_s + ' ' + plate
  end
end
