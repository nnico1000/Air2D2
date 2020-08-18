class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  ERA = ['ljhglhj', 'mkjhgmkugh', 'omughmug']
  CATEGORY = ['mkjhmkjh', 'mkjhgmkugh', 'omughmug']
  BUILDER = ['mkjhmkjh', 'mkjhgmkugh', 'omughmug']
end
