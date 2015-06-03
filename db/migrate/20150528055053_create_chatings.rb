class CreateChatings < ActiveRecord::Migration
  def change
    create_table :chatings do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps null: false
    end
      add_index :chatings, :sender_id
      add_index :chatings, :recipient_id
  end
end
