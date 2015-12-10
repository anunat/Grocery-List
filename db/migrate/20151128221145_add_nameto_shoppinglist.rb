class AddNametoShoppinglist < ActiveRecord::Migration
  def change
    add_column :shoppinglists, :name, :string
  end
end
