class AddFielfForToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :name, :string
    add_column :users, :website, :string
  end
end
