class AddAttachmentToPics < ActiveRecord::Migration
  def change
    add_column :pics, :attachment, :image
  end
end
