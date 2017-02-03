class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :thumbnail
      t.string :name
      t.string :description
      t.integer :comic_count
    end
  end
end
