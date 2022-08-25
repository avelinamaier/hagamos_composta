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
  has_one_attached :photo
end


User.create(first_name: "Luis Enrique", last_name: "Guzman Pineda", street: "ote 245 A #22", city: "CDMX", state: "iztacalco", zip_code: "08500", phone: "5538856480", email: "radiohead_luis13@hotmail.com", password: "123456")
