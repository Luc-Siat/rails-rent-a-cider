class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews
  has_one :reservation
  validates :name, presence: true
end
