class AccountsController < ApplicationController
    before_action :set_account, only: [:destroy]

    def index
        set_index

    end

    def destroy
        if @account.destroy
            set_index
            @notice = "Conta excluir com sucesso"
            respond_to do |format|
              format.js
            end
        end
    end

    def create
      @account = Account.new(params_account)

      if @account.save
         set_index
         @notice =  "Conta #{@account.name} adicionada com sucesso "
         respond_to do |format|
             format.js
         end
      else
         render :index , alert: "Conta #{@account.name} adicionada com sucesso "
      end

    end


    private

        def set_account
          @account = Account.find(params[:id])
        end

        def set_index
            @account = Account.new
            @accounts = Account.where(user: current_user)
        end

        def params_account
                params.require(:account).permit(:name, :account_type, :balance, :day_cut,:user_id)
        end
end
