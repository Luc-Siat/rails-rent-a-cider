class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
  belongs_to :reservations
  #has_one :reservation
  validates :name, presence: true
end
