class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'diyet' },
    { id: 3, name: 'study' },
    { id: 4, name: 'trainig' }
  ]

  include ActiveHash::Associations
  has_many :articles
  end