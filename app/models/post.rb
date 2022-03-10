class Post < ApplicationRecord
  validates :text, presence: true

  belongs_to :community
  belongs_to :user
  has_many :comments
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user
end
