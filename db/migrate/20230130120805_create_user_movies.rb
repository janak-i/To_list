class CreateUserMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_movies do |t|
      t.integer :count
      t.references :user
      t.references :movie

      t.timestamps
    end
  end
end
