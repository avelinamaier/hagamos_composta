class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :subscriptions, through: :bookings
  has_many :bookings
  # PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/
  validates :first_name, :last_name, :address, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, format: { with: PASSWORD_FORMAT }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
end
