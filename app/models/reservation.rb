class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :cider
  # has_one :cider
  validates :date, presence: true
  validates :cider_id, uniqueness: { scope: :user_id }
end
