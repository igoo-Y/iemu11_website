class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :back_number
      t.string :position

      t.timestamps
    end
  end
end
