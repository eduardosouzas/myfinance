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

  def navigation_months(current_month)
    html = "<nav aria-label='Page navigation'>"\
         "<ul class='pagination'><li><a href='#' aria-label=Previous'>"\
         "<span aria-hidden='true'>&laquo;</span></a></li>"

    (current_month - 3..current_month + 3).each do |current|
      date_current = Time.new(Time.zone.now.year, current, 1)
      html << '<li ' <<
        if current == current_month
          "class='active' "
        else
          ' '
        end
      html << "><a href='#'>#{I18n.l(date_current, format: '%B')}</a></li>"
    end
    html << "<li><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span>"\
      '</a></li></ul></nav>'
    html.html_safe
  end

  def sum_transacation(transactions)
    @sum = 0
    transactions.each do |t|
      @sum = if t.type_transaction == 'expense'
               @sum + t.value
             else
               @sum - t.value
             end
    end
    @sum.abs
  end
end
