class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo
end
