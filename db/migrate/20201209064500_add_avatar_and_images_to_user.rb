class AddAvatarAndImagesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :cover_image, :string
  end
end
