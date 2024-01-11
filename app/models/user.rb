class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true

  def downcase_nickname
    nickname.downcase!
  end
end
