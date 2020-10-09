class AddFieldToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :phone, :integer
    add_column :users, :gender, :string
  end
end
