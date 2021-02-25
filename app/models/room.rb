class Room < ApplicationRecord

  has_many :users
  has_one :stance
end
