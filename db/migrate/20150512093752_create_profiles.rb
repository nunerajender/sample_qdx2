class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone_no
      t.string :home_city

      t.timestamps null: false
    end
  end
end
