class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name

      t.timestamps
    end
    add_index(:entities, :name, type: :fulltext)
  end
end
