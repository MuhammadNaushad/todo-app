class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :tasks

  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 100 }
  validates :password, presence: true

  has_secure_password
end
