class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :builder, :description, :era, :price_per_year, presence: true
  validates :name, uniqueness: true
  ERA = ['ljhglhj', 'mkjhgmkugh', 'omughmug']
  CATEGORY = ['mkjhmkjh', 'mkjhgmkugh', 'omughmug']
  BUILDER = ['mkjhmkjh', 'mkjhgmkugh', 'omughmug']
end
