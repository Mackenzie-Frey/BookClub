class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :published_year
      t.string :img, default: 'https://klkranes.files.wordpress.com/2018/07/classic-lit-2.jpg?w=1024'

      t.timestamps
    end
  end
end
