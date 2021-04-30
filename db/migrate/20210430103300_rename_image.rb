class RenameImage < ActiveRecord::Migration[6.0]
  def change
    rename_column :matches, :image, :avatar
  end
end
