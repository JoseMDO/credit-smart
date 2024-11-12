class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.string :name
      t.integer :annual_fee
      t.string :issuer
      t.string :url
      t.string :details

      t.timestamps
    end
  end
end
