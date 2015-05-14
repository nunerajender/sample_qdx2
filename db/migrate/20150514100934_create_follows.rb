class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :following_id
      t.integer :user_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
