class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.boolean :watched
      t.integer :rating
      t.string :comment

      t.timestamps null: false
    end
  end
end
