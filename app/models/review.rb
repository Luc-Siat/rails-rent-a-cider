class Review < ApplicationRecord
  belongs_to :cider
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: 0..5 }
end
