class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :session_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :sport_sessions, through: :session_users
  has_one_attached :photo

  validates :username, uniqueness: true
end
