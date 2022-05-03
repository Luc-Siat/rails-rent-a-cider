class Reservation < ApplicationRecord
  belongs_to :user, :cider
  # has_one :cider
  validates :date, presence: true
end
