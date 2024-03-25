class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.references :category, null: false, foreign_key: true
      t.references :credit_card, null: false, foreign_key: true
      t.decimal :percentage_back

      t.timestamps
    end
  end
end
