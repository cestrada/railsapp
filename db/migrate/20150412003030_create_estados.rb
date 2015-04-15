class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :name

      t.timestamps
    end
    add_index(:estados, :name, type: :fulltext)
  end
end
