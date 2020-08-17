class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
end
