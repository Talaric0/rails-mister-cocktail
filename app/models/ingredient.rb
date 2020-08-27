class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
end
