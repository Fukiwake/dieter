class RemoveDietStyleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :diet_style, :integer
  end
end
