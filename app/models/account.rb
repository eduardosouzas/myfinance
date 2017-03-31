class Account < ActiveRecord::Base
  belongs_to :user

  enum account_type: [:bank, :crediCard]

  monetize :balance_cents
end
