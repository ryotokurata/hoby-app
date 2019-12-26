class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :comment
      t.integer :group_id
      t.integer :user_id
      t.integer :message_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
