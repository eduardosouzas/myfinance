# Class de controle das transacoes
class TransactionsController < ApplicationController
  def index
    params_index
    @transaction = Transaction.new
  end

  def show; end

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

  def params_index
    @date = Time.zone.now
    @month = if params[:month].blank?
               @date.month
             else
               params[:month]
             end
    @date_initial = Date.new(@date.year, @date.month, 1)
    @date_final = Date.new(@date.year, @date.month, 30)
    @account_id = if params[:account_id].blank?
                    current_user.accounts[0].id
                  else
                    params[:account_id]
                  end
    @transactions = Transaction.between_month(@date_initial, @date_final,
                                              @account_id)
  end
end
