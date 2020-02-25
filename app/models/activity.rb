class Activity < ApplicationRecord
  has_many :sport_sessions

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location]
    # using: {
    #   tsearch: { prefix: true }
    # }
end
