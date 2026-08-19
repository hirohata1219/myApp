class User < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :age, presence: true
  validates :age, numericality: { only_integer: true }, if: -> { age.present? }
  validates :phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true }, if: -> { phone_number.present? }
  validates :email, presence: true, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:password_digest] }

  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :posts, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end

  def generate_reset_password_token!
    reset_password_token = SecureRandom.hex(16)
    while User.exists?(reset_password_token:)
      reset_password_token = SecureRandom.hex(16)
    end
    self.reset_password_token = reset_password_token
    update!(reset_password_token_expires_at: 1.hour.from_now)
  end
  
end
