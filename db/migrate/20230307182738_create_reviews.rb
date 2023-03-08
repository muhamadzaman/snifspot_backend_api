class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.decimal :rating, null: false
      t.string :review_comment, null: false
      t.references :spot
      
      t.timestamps
    end
  end
end
