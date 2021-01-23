class AddDietStyleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :diet_style1, :string
    add_column :users, :diet_style2, :string
    add_column :users, :diet_style3, :string
    add_column :users, :diet_style4, :string
  end
end
