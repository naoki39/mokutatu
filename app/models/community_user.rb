class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :posts
end
