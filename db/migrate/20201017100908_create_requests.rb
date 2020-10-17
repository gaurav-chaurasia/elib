class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :status, index: true, :default => 'pending'
      t.timestamps
    end
  end
end
