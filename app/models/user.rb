class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :subscription, optional: true
  has_many :bookings, dependent: :destroy
  # PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/
  validates :first_name, :last_name, :street, :city, :state, presence: true
  validates :zip_code, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { minimum: 10 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, format: { with: PASSWORD_FORMAT }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
