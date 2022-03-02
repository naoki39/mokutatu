class Community < ApplicationRecord
  has_many :users, through: :community_users

end
