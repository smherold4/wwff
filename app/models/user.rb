class User < ApplicationRecord

  has_many :user_auth_keys

  before_validation :clean_name
  before_validation :clean_email
  before_validation :clean_phone

  before_save :clear_password_reset_code, if: :password_digest_changed?

  has_secure_password
  validates :password, length: { minimum: 6, allow_nil: true }

  def clean_name
    self.first_name = self.first_name.split.map(&:capitalize).join(' ') if self.first_name
    self.last_name = self.last_name.split.map(&:capitalize).join(' ') if self.last_name
  end

  def clean_email
    self.email = self.email.strip.downcase.gsub(/\.con\z/, '.com') if self.email
  end

  def clean_phone
    return nil if self.phone.nil?
    self.phone = self.phone.strip.gsub(/\D/, '')
    self.phone.slice!(0) if phone.length == 11 && phone[0] == '1'
    self.phone
  end

  def clear_password_reset_code
    self.password_reset_code = nil
    self.password_reset_code_sent_at = nil
  end

end

