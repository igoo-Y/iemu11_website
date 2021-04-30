class RenameImageUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :matches, :image_url, :image
  end
end