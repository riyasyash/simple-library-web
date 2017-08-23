class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.string :authors
      t.string :publisher
      t.string :yop
      t.text :description
      t.integer :page_count
      t.string :small_thumbnail
      t.string :thumbnail

      t.timestamps
    end
  end
end
