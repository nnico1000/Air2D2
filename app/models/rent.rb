class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :droid
  validate :end_year_superior_to_start_year
  validate :year_rent_not_superior_500

  private

  def end_year_superior_to_start_year
    if end_year < start_year
      errors.add(:end_year, "can't be before start_year")
    end
  end

  def year_rent_not_superior_500
    if end_year - start_year > 500
      errors.add(:end_year, "can't be superior to 500")
    end
  end
end
