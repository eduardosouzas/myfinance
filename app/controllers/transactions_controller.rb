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
      account_id: @account_id )
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end
end
