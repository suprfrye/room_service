class Room < ActiveRecord::Base
  has_many :appointments
end
