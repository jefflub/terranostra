class User < ApplicationRecord
  has_secure_password

  # This email validator only validates the most egregious cases. It is NOT a fully correct validator
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

  def as_json(options={})
    options[:except] ||= [:password_digest]
    super(options)
  end
end
