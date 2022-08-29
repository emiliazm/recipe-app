class User < ApplicationRecord
  has_many :recipes
  has_many :foods

  validates :name, presence: true, length: { in: 2..25 }

end