class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account

  enum type_transaction: %i(expense income)
  monetize :value_cents

  scope :between_month, ->(date_start, date_finish, account_id) {
    where(date_transaction: date_start..date_finish,
          account_id: account_id).order(:date_transaction)
  }
end
