class User < ApplicationRecord

  attr_reader :password

  before_validation :ensure_session_token

  validates :user_name, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.update!(session_token: SecureRandom.urlsafe_base64(16))
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name)
    user && user.is_password?(password) ? user : nil
  end

end
