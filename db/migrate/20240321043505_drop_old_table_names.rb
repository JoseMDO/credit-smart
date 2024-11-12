class DropOldTableNames < ActiveRecord::Migration[7.0]
  def change

    drop_table :user_transactions if ActiveRecord::Base.connection.table_exists? :user_transactions
    drop_table :favorites if ActiveRecord::Base.connection.table_exists? :favorites
    drop_table :rewards if ActiveRecord::Base.connection.table_exists? :rewards
    drop_table :categories if ActiveRecord::Base.connection.table_exists? :categories
    # Repeat for other old table names
  end
end
