class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
       
  with_options presence: true do
    validates :image
    validates :nickname
    validates :goal, format: { with: /(?=.*\d)/ }
    validates :second_goal, format: { with: /(?=.*\d)/ }
    validates :to_do, format: { with: /(?=.*\d)/ }
  end

  has_many :communities, through: :community_users
  has_one_attached :image     
end
