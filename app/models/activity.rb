class Activity < ApplicationRecord
  has_many :sessions

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location]
    # using: {
    #   tsearch: { prefix: true }
    # }
end
