class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :supplier_id

      t.timestamps
    end
  end
end
