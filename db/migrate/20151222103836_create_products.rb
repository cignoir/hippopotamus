class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :workshop, index: true, foreign_key: true
      t.integer :sec
      t.integer :required_level
      t.integer :amount

      t.timestamps null: false
    end
  end
end
