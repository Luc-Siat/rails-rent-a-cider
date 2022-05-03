class Cider < ApplicationRecord
  has_many :reviews
  belongs_to :reservations
  has_many :reservation
  validates :name, presence: true
end
