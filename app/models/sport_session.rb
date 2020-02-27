class SportSession < ApplicationRecord
  CAPACITY = [1, 2, 3, 4, 5]
  LEVEL = ['beginner', 'intermediate', 'expert']
  belongs_to :activity
  has_many :session_users, dependent: :destroy
  has_many :users, through: :session_users
  has_many :messages, dependent: :destroy
  has_one_attached :photo

  validates :location, presence: true
  validates :start_time, presence: true
  validates :capacity, inclusion: { in: CAPACITY , message: ': Please choose between 1 and 5' }
  validates :level, inclusion: { in: LEVEL , message: ': Please choose between Beginner, Intermediate and Expert' }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
