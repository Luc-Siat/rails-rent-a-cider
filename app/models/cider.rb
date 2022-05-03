class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, :reservations
  validates :name, presence: true
end
