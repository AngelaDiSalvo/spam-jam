class User < ApplicationRecord
  has_many :spam_emails
  has_many :fake_emails
  has_many :victims, through: :spam_emails
end
