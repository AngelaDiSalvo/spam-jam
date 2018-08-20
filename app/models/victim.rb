class Victim < ApplicationRecord
  has_many :emails
  has_many :users, through: :emails
end
