class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :favored
      t.integer :value_cents, default:0
      t.integer :type_transaction
      t.date    :date_transaction
      t.references :category, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
