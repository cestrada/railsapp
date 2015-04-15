class CreateCofis < ActiveRecord::Migration
  def change
    create_table :cofis do |t|
      t.string :name

      t.timestamps
    end
    add_index(:cofis, :name, type: :fulltext)
  end
end
