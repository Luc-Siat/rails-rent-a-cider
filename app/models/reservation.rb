class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cider
  # has_one :cider
  validates :date, presence: true
end
