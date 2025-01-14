class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :type
      t.string :url
      t.integer :score
      t.string :author
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
