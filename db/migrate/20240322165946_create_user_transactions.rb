class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
