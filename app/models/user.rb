class User < ApplicationRecord
  has_many :emails
  has_many :fake_emails
  has_many :victims, through: :emails
end
