class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :name
      t.datetime :date

      t.timestamps null: false
    end
  end
end
