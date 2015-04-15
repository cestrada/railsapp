class CreateOriginators < ActiveRecord::Migration
  def change
    create_table :originators do |t|
      t.string :name

      t.timestamps
    end
    add_index(:originators, :name, type: :fulltext)
  end
end
