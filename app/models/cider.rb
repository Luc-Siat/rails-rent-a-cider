class Cider < ApplicationRecord
  has_many :reviews
  belongs_to :reservations
  #has_one :reservation
end
