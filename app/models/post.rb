class Post < ApplicationRecord

  belongs_to :user
  belongs_to :room
  has_one_attached :image
  
  with_options length: { maximum: 200 } do
    validates :post_a, presence: true, unless: :post_b?
    validates :post_b, presence: true, unless: :post_a?
  end

end