class SessionUser < ApplicationRecord
  belongs_to :session
  belongs_to :user, dependent: :destroy

  validates :owner, presence: true
end
