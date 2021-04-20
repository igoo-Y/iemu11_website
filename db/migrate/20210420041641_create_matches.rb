class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :title
      t.text :content
      t.string :time
      t.string :place
      t.string :score
      t.string :opponent
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
