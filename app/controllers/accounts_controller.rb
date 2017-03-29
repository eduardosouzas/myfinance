class AccountsController < ApplicationController

    def index
            @account = Account.new
            @accounts = Account.where(user: current_user)
    end

    def create
      @account = Account.new(params_account)

      if @account.save
          index
         @notice =  "Conta #{@account.name} adicionada com sucesso "
         respond_to do |format|
             format.js
         end
      else
         render :index , alert: "Conta #{@account.name} adicionada com sucesso "
      end

    end


    private

        def params_account
                params.require(:account).permit(:name, :account_type, :balance, :day_cut,:user_id)
        end
end
