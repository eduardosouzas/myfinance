class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :balance_cents, default:0
      t.integer :day_cut
      t.integer :account_type

      t.timestamps null: false
    end
  end
end
