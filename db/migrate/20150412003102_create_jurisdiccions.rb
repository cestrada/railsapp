class CreateJurisdiccions < ActiveRecord::Migration
  def change
    create_table :jurisdiccions do |t|
      t.string :name

      t.timestamps
    end
    add_index(:jurisdiccions, :name, type: :fulltext)
  end
end
