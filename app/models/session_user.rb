class SessionUser < ApplicationRecord
  STATUS = ['accepted', 'rejected', 'pending']
  belongs_to :sport_session
  belongs_to :user

  validates_inclusion_of :owner, in: [true, false]
  validates_uniqueness_of :user_id, scope: :sport_session_id
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }

  after_create :check_sport_session_status

  private

  def check_sport_session_status
    sport_session = self.sport_session
    accepted_sport_session_users = sport_session.session_users.where(status: "accepted").count
    sport_session.update(open_status: false) if sport_session.capacity == accepted_sport_session_users
  end
end
