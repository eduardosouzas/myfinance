# Class de controle das transacoes
class TransactionsController < ApplicationController
  def index
    params_index
    @transaction = Transaction.new
  end

  def show; end

  def pagination
    params_index
    @transaction = Transaction.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @transaction = Transaction.new(params_transaction)

    if @transaction.save
      @notice = 'Transaçao salva com sucesso'
      params_index
      respond_to do |format|
        format.js
      end
    end
  end

  def edit; end

  def update; end

  private

  def params_transaction
    params.require(:transaction).permit(:favored, :account_id,
                                        :category_id, :type_transaction,
                                        :date_transaction, :value)
  end

  def set_month
    @date = Time.zone.now
    @month = if params[:month].blank?
               @date.month
             else
               params[:month]
             end
  end

  def set_account_id
    set_month
    account_id = if params[:transaction][:account_id].blank?
                   current_user.accounts[0].id
                 else
                   params[:transaction][:account_id]
                 end
    @account = Account.find(account_id)
  end

  def params_index
    set_account_id
    @date_initial = Date.new(@date.year, @month.to_i, 1)
    @date_final = Date.new(@date.year, @month.to_i, @month.to_i == 2 ? 28 : 30)
    @transactions = Transaction.between_month(@date_initial, @date_final,
                                              @account.id)
  end
end
