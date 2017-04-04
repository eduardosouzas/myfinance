# Class de controle das transacoes
class TransactionsController < ApplicationController
  def index
    if params[:month].blank?
      @date_initial = Date.new(Time.now.year, Time.now.month, 1)
      @date_final = Date.new(Time.now.year, Time.now.month, 30)
    else
      @date_initial = Date.new(Time.now.year, params[:month], 1)
      @date_final = Date.new(Time.now.year, params[:month], 30)
    end

    @account_id = params[:account_id].blank? ?
     current_user.accounts[0].id : params[:account_id]

    @transactions = Transaction.where(
      date_transaction: @date_initial..@date_final,
      account_id: @account_id
    )

    @transaction = Transaction.new
  end

  def show; end

  def create
    @category = Transaction.new(params_transaction)

    if @category.save
      @notice = "Transaçao salva com sucesso"
      index
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
end
