class Room < ApplicationRecord

  has_many :users, through: :posts
  has_many :posts
  has_one :stance

  with_options presence: true do
    validates :agenda, length: { maximum: 50 }
    with_options length: { maximum: 20 } do
    validates :stanceA
    validates :stanceB
    end
    validates :user_id
  end
end

