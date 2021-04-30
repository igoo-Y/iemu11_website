class AddImageUrlToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :image_url, :string
  end
end
