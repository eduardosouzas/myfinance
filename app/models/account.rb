class Account < ActiveRecord::Base
     belongs_to :user
     enum type: [ :bank, :crediCard ]

     monetize :balance_cents
end
