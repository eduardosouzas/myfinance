# Helper for class transactions
module TransactionsHelper

  OptionsForTransactionsTypes = Struct.new(:id, :description)

  def select_for_options_categories
    Category.where(user_id: current_user)
  end

  def select_for_options_accounts
    Account.where(user_id: current_user)
  end

  def options_for_account_types
    Transaction.type_transactions_i18n.map do |key, value|
      OptionsForTransactionsTypes.new(key, value)
    end
  end
end
