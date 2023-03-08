class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.json :images

      t.timestamps
    end
  end
end
