class Victim < ApplicationRecord
  has_many :spam_emails
  has_many :users, through: :spam_emails
end
