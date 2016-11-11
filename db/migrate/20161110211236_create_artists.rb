class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.integer :rating
      t.string :bio
      t.belongs_to :billboard, foreign_key: true

      t.timestamps
    end
  end
end
