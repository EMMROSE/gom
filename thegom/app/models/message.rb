class Message < ApplicationRecord
  belongs_to :user
  belongs_to :sport_session
end
