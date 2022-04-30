class Reservation < ApplicationRecord
  belongs_to :user
  #belongs_to :cider
  has_one :cider
end
