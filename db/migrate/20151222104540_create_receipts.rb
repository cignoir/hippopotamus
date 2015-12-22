class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :material_id, null: false
      t.integer :quantity

      t.timestamps null: false
    end

    add_index :receipts, :material_id
  end
end
