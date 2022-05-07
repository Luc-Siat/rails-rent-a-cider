class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_one :reservation, dependent: :destroy
  validates :name, presence: true
end
