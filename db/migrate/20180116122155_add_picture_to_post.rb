class AddPictureToPost < ActiveRecord::Migration[5.1]
  def change
    add_attachment :posts, :picture
  end
end
