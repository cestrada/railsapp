class CreateCreditedPeople < ActiveRecord::Migration
  def change
    create_table :credited_people do |t|
      t.integer :credit_number
      t.string :name
      t.string :last_name
      t.string :mother_last_name
    end
    add_index :credited_people, :credit_number
    add_index(:credited_people, :name, type: :fulltext)
    add_index(:credited_people, :last_name, type: :fulltext)
    add_index(:credited_people, :mother_last_name, type: :fulltext)
  end
end
