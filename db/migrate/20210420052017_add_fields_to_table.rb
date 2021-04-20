class AddFieldsToTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tables, :recent_form, :string
    add_column :tables, :user_id, :integer
  end
end
