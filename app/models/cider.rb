class Cider < ApplicationRecord
  has_many :reviews
  belongs_to :reservations
  #has_one :reservation
  has_one_attached :photo
  validates :name, presence: true
end
