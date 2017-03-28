module AccountsHelper
    OptionsForTypes = Struct.new(:id, :description)

  def options_for_types
    Account.types_i18n.map do |key, value|
      OptionsForTypes.new(key, value)
    end
  end
end
