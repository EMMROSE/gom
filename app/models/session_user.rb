class SessionUser < ApplicationRecord
  belongs_to :sport_session
  belongs_to :user

  validates_inclusion_of :owner, in: [true, false]
end
