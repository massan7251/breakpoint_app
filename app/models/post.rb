class Post < ApplicationRecord

  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :room
  has_one_attached :image
  
  with_options length: { maximum: 200 } do
    validates :post_a, presence: true, unless: :post_b?
    validates :post_b, presence: true, unless: :post_a?
  end

end