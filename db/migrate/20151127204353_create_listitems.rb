class CreateListitems < ActiveRecord::Migration
  def change
    create_table :listitems do |t|
      t.text :notes
      t.integer :shoppinglist_id
      t.integer :item_id
      t.float :quantity

      t.timestamps

    end
  end
end
