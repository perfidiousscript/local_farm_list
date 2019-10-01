class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :farm_name
      t.float :latitude
      t.float :longitude
    end
    add_reference :farms, :users
  end
end
