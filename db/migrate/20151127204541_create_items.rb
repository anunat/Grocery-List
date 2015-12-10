class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :unit_id
      t.float :default_qty
      t.boolean :favorite
      t.integer :user_id
      t.string :image
      t.integer :department_id
      t.string :name

      t.timestamps

    end
  end
end
