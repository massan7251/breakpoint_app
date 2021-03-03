class Post < ApplicationRecord

  belongs_to :user
  belongs_to :room
  
  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }, length: { maximum: 200 } do
    validates :post_a
    validates :post_b
  end

end
