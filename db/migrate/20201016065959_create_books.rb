class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title,     null: false
      t.text :description
      t.string :auther,    null: false
      t.integer :quantity,  default: 0
      t.integer :isbn,     null: false

      t.timestamps
      t.index [ :isbn ], unique: true
    end
  end
end
