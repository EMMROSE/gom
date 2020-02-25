class SportSession < ApplicationRecord
  CAPACITY = [1, 2, 3, 4, 5]
  LEVEL = ['beginner', 'intermediate', 'expert']
  belongs_to :activity, dependent: :destroy
  has_many :session_users, dependent: :destroy
  has_many :users, through: :session_users

  validates :location, presence: true
  validates :start_time, presence: true
  validates :capacity, inclusion: { in: CAPACITY }
  validates :level, inclusion: { in: LEVEL }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
