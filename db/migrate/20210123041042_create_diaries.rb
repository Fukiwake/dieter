class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :body
      t.float :weight
      t.float :body_fat_percentage
      t.date :post_date
      t.string :image1_id
      t.string :image2_id
      t.string :image3_id
      t.integer :user_id

      t.timestamps
    end
  end
end
