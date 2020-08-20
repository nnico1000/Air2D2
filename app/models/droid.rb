class Droid < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  validates :name, :category, :builder, :description, :era, :price_per_year, presence: true
  validates :name, uniqueness: true
  ERA = ['Old Republic', 'New Republic', 'Empire Sith' ]
  CATEGORY = ['Astomecano', 'Combat', 'Medical', 'Technicien', 'Utilitaire' ]
  BUILDER = ['Les mines de Dorvalla', 'Maison organa', 'République galactique', 'Résistance']
  PICTURE = ["https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/2vr8_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droide_arbitre_he2_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droiderqvig.jpg",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droide_dx11_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/t0b4_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/bf4f_vignette.png",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/droideka.jpg", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/yg3_vignette.png",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/triple0_vig.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/o-66_vig.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/c3po_vignette.jpg",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/R3DO_avatar.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/zero_vignette.png",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/z9v86_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/tyth_vignette.png", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/e10_vignette.jpg",
  "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/224ava.jpg", "https://www.starwars-universe.com/images/encyclopedie/droides/vignettes_v6/2BB2vignette.jpg", "https://i.pinimg.com/originals/fa/16/42/fa164207f82b769dec7719b3156355e3.jpg"]


  def booked?(start_year, end_year)
    Rent.all.each do |r|
      return false if (r.start_year..r.end_year).overlaps?(start_year..end_year)
    end
    # rents.where("start_year < ?", start_year).where("end_year > ?", start_year).first.present? || rents.where("start_year < ?", end_year).where("end_year > ?", end_year).first.present? || rents.where("start_year > ?", start_year).where("end_year < ?", end_year).first.present?
  end

  include PgSearch::Model
  multisearchable against: [:era, :category, :builder]

end
