class Review < ApplicationRecord
  belongs_to :cider
  belongs_to :user
end
