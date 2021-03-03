class Post < ApplicationRecord

  belongs_to :user
  belongs_to :room
  

  #validate :required_either_post_a_or_poset_b
  with_options length: { maximum: 200 } do
    validates :post_a, presence: true, unless: :post_b?
    validates :post_b, presence: true, unless: :post_a?
  end

  #private

  #def required_either_post_a_or_poset_b
    #return if post_a.present? ^ post_b.present?
  #end

end