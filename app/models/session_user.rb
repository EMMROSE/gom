class SessionUser < ApplicationRecord
  belongs_to :sport_session
  belongs_to :user, dependent: :destroy

  validates :owner, presence: true
end
