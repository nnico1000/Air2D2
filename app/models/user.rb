class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  SPECIES = ['Yuzzum', 'Utapaun', 'Chagrian', 'Gand', 'Talz', 'Clawdites', 'Human', 'Kitonak']
  PLANET = ['Aargonar', 'Byss', 'Jabiim', 'Killun', 'Sebaddon', 'Stewjon', 'Wynkahthu', 'Zeffo']
  has_many :droids, dependent: :destroy
  has_many :rents
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
end
