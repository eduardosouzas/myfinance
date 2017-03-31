class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  enum type_transaction: [:expense, :income]
  monetize :value_cents
end
