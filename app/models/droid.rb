class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  validates :name, :category, :builder, :description, :era, :price_per_year, presence: true
  validates :name, uniqueness: true
end
