class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :users, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
