class Community < ApplicationRecord
  has_many :users, through: :community_users
  has_many :community_users
end
