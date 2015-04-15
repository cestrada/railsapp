class CreateEntidads < ActiveRecord::Migration
  def change
    create_table :entidads do |t|
      t.string :name

      t.timestamps
    end
    add_index(:entidads, :name, type: :fulltext)
  end
end
