class CreateCoffees < ActiveRecord::Migration[7.1]
  def change
    create_table :coffees do |t|
      t.string :name
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
