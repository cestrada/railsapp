class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :box_number, limit: 9
      t.integer :count_docs, default: 0

      t.timestamps
    end
    add_index :boxes, :box_number
    add_index :boxes, :count_docs
  end
end
