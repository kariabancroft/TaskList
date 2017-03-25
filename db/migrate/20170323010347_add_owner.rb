class AddOwner < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :owner, :string
  end
end
