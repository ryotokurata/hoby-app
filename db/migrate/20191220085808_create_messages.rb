class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.text :text
      t.string :image
      t.integer :group_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
