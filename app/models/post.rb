class Post < ApplicationRecord

  belongs_to :user
  belongs_to :room
  

  validate :require_either_a_or_b
  with_options length: { maximum: 200 } do
    validates :post_a
    validates :post_b
  end

  private

  def require_either_a_or_b
    return if post_a.present? ^ post_b.present?
  end

end
