class SpamType < ApplicationRecord
  has_many :emails
  has_many :victims, through: :emails
  has_many :users, through: :emails
end
