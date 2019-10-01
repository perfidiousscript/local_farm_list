class AddFarmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :farms
  end
end
