class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

         with_options presence: true do
           validates :nickname
           validates :goal, format: { with: /(?=.*\d)/ }
           validates :second_goal, format: { with: /(?=.*\d)/ }
           validates :to_do, format: { with: /(?=.*\d)/ }
           validates :image
         end
  
  has_one_attached :image
  has_many :community_users
  has_many :communities, through: :community_users
  has_many :posts
end
