class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
  has_one :reservationn, dependent: :destroy
  validates :name, presence: true
end
