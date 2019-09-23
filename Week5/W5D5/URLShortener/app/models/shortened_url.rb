# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, presence: true

  def self.random_code
    random = SecureRandom::urlsafe_base64
    while self.exists?(short_url: random)
      random = SecureRandom::urlsafe_base64
    end
    random
  end

  def self.create(user, l_url)
    ShortenedUrl.create!(user_id: user.id, long_url: l_url, short_url: self.random_code)
  end
end
