class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :users, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
