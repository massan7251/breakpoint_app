class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender
  belongs_to :job

  with_options presence: true do
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
    validates :name, length: { maximum: 10 }
    validates :birthday
  end

  with_options numericality: { other_than: 1 } do
  validates :prefecture_id
  validates :gender_id
  validates :job_id
  end
end
