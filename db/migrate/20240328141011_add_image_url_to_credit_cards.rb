class AddImageUrlToCreditCards < ActiveRecord::Migration[7.0]
  def change
    add_column :credit_cards, :image_url, :string
  end
end
