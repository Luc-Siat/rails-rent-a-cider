class Cider < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_one :reservation, dependent: :destroy
  validates :name, presence: true

  include PgSearch::Model
  scope :sorted, ->{ order(name: :asc) }
  pg_search_scope :global_search,
  against: [ :name, :region , :flavor ],
  using: { tsearch: { prefix: true } }
end
