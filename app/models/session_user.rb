class SessionUser < ApplicationRecord
  STATUS = ['accepted', 'rejected', 'pending']
  belongs_to :sport_session
  belongs_to :user

  validates_inclusion_of :owner, in: [true, false]
  validates_uniqueness_of :user_id, scope: :sport_session_id
  validates :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
