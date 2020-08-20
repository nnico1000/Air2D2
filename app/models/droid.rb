class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :builder, :description, :era, :price_per_year, presence: true
  validates :name, uniqueness: true
  ERA = ['Old Republic', 'New Republic', 'Empire Sith' ]
  CATEGORY = ['Astomecano', 'Combat', 'Medical', 'Technicien', 'Utilitaire' ]
  BUILDER = ['Les mines de Dorvalla', 'Maison organa', 'République galactique', 'Résistance']


  def booked?(start_year, end_year)
    Rent.all.each do |r|
      return false if (r.start_year..r.end_year).overlaps?(start_year..end_year)
    end
    #rents.where("start_year < ?", start_year).where("end_year > ?", start_year).first.present? || rents.where("start_year < ?", end_year).where("end_year > ?", end_year).first.present? || rents.where("start_year > ?", start_year).where("end_year < ?", end_year).first.present?
  end

  include PgSearch::Model
  multisearchable against: [:era, :category, :builder]

end
