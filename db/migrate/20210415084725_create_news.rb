class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :view_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
