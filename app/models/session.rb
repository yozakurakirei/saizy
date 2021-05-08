class Session < ApplicationRecord
  # login
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # with_optionでまとめる
  with_options presence: true do 
    validates :name, length: { maximum: 30 },uniqueness: true
    validates :email, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true
    validates :password, length: { minimum: 6 }
  end
  has_secure_password 
  validates_acceptance_of :agreement, allow_nil: false, on: :create
end
