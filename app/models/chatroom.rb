class Chatroom < ApplicationRecord
  has_many :messages
  has_one :sport_session, dependent: :destroy
end
