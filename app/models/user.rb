class User < ApplicationRecord
  has_secure_password
  validates :email, confirmation: true, uniqueness: { case_sensitive: false }
  validates :email_confirmation, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
