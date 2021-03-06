class User < ApplicationRecord

  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token
  attr_reader :password

  def password=(pw)
    self.password_digest = BCrypt::Password.create(pw)
    @password = pw
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      if user.is_password?(password)
        user
      else
        nil
      end
    else
      nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end
  
end
