class AccountsController < ApplicationController
    def index
            @account = Account.new
    end

    def create
      @account = Account.new(params_account)

      if @account.save


    end


    private

        def params_account
                params.require(:account).permit(:name, :type, :balance, :day_cut)
        end
end
