class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  has_one_attached :image     
end
