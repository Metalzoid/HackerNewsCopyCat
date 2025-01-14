class CreateInteractions < ActiveRecord::Migration[7.1]
  def change
    create_table :interactions do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :interactable, polymorphic: true, null: false
      t.string :type

      t.timestamps
    end
  end
end
