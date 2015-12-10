class CreateShoppinglists < ActiveRecord::Migration
  def change
    create_table :shoppinglists do |t|
      t.integer :user_id

      t.timestamps

    end
  end
end
