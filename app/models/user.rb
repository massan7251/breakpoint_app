class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender
  belongs_to :job

  with_options numericality: { other_than: 1 } do
  validates :prefecture_id
  validates :gender_id
  validates :Job_id
  end
end
