class Cider < ApplicationRecord
<<<<<<< HEAD
  has_many :reviews
  belongs_to :reservations
  has_many :reservation
=======
  has_one_attached :photo
  has_many :reviews, :reservations
>>>>>>> master
  validates :name, presence: true
end
