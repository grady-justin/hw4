class User < ApplicationRecord
  has_many :entries
  has_secure_password
  validates :email, uniqueness: true
end