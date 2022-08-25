require 'open-uri'

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
  after_validation :default_avatar

  private

  def default_avatar
    unless self.photo.attached?
      file = URI.open("https://res.cloudinary.com/dqfnzfthu/image/upload/v1661464299/avatar-g0212f9dd5_640_dsnzfw.png")
      self.photo.attach(io: file, filename: "default_avatar_#{self.first_name}", content_type: "image/png")
      self.save
    end
  end
end
