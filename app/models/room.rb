class Room < ApplicationRecord

  belongs_to :user
  has_many :posts

  with_options presence: true do
    validates :agenda, length: { maximum: 50 }
    with_options length: { maximum: 20 } do
    validates :stanceA
    validates :stanceB
    end
    validates :user_id
  end
end

