class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :droid
  validates :user_id, uniqueness: { scope: :droid_id }
end
