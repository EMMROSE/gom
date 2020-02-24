class Session < ApplicationRecord
  CAPACITY: [1, 2, 3, 4, 5]
  LEVEL: ["beginner", "intermediate", "expert"]
  belongs_to :activity
  has_many :session_users
  has_many :users, through: :session_users

  validates :location, presence: true
  validates :start_time, presence: true
  validates :capacity, inclusion: { in: CAPACITY}
  validates :level, inclusion: { in: LEVEL}
  validates :end_date, numericality: { greater_than: :start_date}
end
