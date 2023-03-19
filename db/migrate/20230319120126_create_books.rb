class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.hstore :book_cover_images
      t.text :genre
      t.string :publisher
      t.date :date_of_publication
      t.integer :pages
      t.string :language
      t.string :isbn
      t.integer :price

      t.timestamps
    end
  end
end
