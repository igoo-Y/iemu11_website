class AddImageUrlToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :image_url, :string
  end
end
