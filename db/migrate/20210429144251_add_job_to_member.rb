class AddJobToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :job, :string
  end
end
