class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 3}

  has_many :posts, dependent: :destroy
end
