class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true, length: { in: 2..25 }
  validates :description, presence: true, length: { in: 2..250 }
  validates :preparion_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
