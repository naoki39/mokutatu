class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate do
    unless user && user.votable_for?(post)
      errors.add(:base, :invalid)
    end
  end
end
