class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :tasks

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
end
