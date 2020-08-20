class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :builder, :description, :era, :price_per_year, presence: true
  validates :name, uniqueness: true
  ERA = ['Old Republic', 'New Republic', 'Empire Sith' ]
  CATEGORY = ['Astomecano', 'Combat', 'Medical', 'Technicien', 'Utilitaire' ]
  BUILDER = ['Les mines de Dorvalla', 'Maison organa', 'République galactique', 'Résistance']

  include PgSearch::Model
  multisearchable against: [:era, :category, :builder]
end
