module AccountsHelper
    OptionsForAccountTypes = Struct.new(:id, :description)

  def options_for_account_types
    Account.account_types_i18n.map do |key, value|
      OptionsForAccountTypes.new(key,value)
    end
  end
end
