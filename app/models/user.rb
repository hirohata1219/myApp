class User < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :age, presence: true
  validates :age, numericality: { only_integer: true }, if: -> { age.present? }
  validates :phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true }, if: -> { phone_number.present? }
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:password_digest] }

  has_many :posts, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end
  
end
