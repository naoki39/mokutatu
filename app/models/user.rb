class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, on: :create

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
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :votes,dependent: :destroy
  has_many :voted_post, through: :votes, source: :post

  def votable_for?(post)#いいねボタンを押せるか判断
    post && post.user != self && !votes.exists?(post_id: post.id)
  end

  def deletable_for?(post)#いいねボタンを解除できるか判断
    post && post.user != self && votes.exists?(post_id: post.id)
  end
end
