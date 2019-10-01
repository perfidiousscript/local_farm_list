class AddProductsToFarm < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :products, :jsonb, null: false, default: '{}'
    add_index  :farms, :products, using: :gin
  end
end
