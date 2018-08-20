class Email < ApplicationRecord
  belongs_to :user
  belongs_to :victim
  belongs_to :spam_type
end
