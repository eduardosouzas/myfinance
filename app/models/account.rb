class Account < ActiveRecord::Base
     belongs_to :user
     TYPES = {:bank => 0, :crediCard => 1}
     enum type: TYPES

     monetize :balance_cents
end
