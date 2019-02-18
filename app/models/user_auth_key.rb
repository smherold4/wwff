class UserAuthKey < ApplicationRecord

  belongs_to :user

  validates_presence_of(:user, :encrypted_key)

  def self.secure_hash(data)
    Digest::SHA1.hexdigest(data)
  end

  def self.create_for_user(user)
    key = SecureRandom.urlsafe_base64
    [
      key,
      UserAuthKey.create!(user: user, encrypted_key: self.secure_hash(key))
    ]
  end

end
