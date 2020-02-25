class SessionUser < ApplicationRecord
  belongs_to :sport_session
  belongs_to :user

  validates_inclusion_of :owner, in: [true, false]
  validates_uniqueness_of :user_id, scope: :sport_session_id
end
