# Helper for class transactions
module TransactionsHelper
  OptionsForTransactionsTypes = Struct.new(:id, :description)

  def select_for_options_categories
    Category.where(user_id: current_user)
  end

  def select_for_options_accounts
    Account.where(user_id: current_user)
  end

  def options_for_account_types_transactions
    Transaction.type_transactions_i18n.map do |key, value|
      OptionsForTransactionsTypes.new(key, value)
    end
  end

  def sum_transacation(transactions)
    @sum = 0
    transactions.each do |t|
      @sum = t.type_transaction == 'expense' ? @sum + t.value : @sum - t.value
    end
    @sum.abs
  end

  def navigation_months
    @html = "<nav aria-label='Page navigation'><ul class='pagination'>"
    if @month.to_i <= 3
      @initial = 1
      @final = 7
    elsif @month.to_i >= 9
      @final = 12
      @initial = @final - 6
    else
      @initial = @month.to_i - 3
      @final = @month.to_i + 3
    end
    @month.to_i == @initial ? @html << '<li class="disabled">' : @html << '<li>'
    @html << "<a href='#' onclick='pagination(#{@month.to_i - 1})' aria-label='Previous'>"\
     "<span aria-hidden='true'>&laquo;</span></a></li>"
    (@initial..@final).each do |current|
      date_current = Time.new(Time.zone.now.year, current, 1)
      @html << "<li #{class_active(current, @month.to_i)}" << '> '
      @html << "<a href='#' onclick='pagination(#{current})' >"\
      "#{I18n.l(date_current, format: '%B')}</a></li>"
    end
    @month.to_i == @final ? @html << '<li class="disabled">' : @html << '<li>'
    @html << "<a href='#' onclick='pagination(#{@month.to_i + 1})'  "\
    "aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li></ul></nav>"
    @html.html_safe
  end

  private

  def class_active(current, current_month)
    if current == current_month
      "class='active' "
    else
      ' '
    end
  end
end
