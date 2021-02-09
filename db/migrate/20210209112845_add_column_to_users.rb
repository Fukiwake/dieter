class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :weight, :float
  end
end
