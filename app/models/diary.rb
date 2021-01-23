class Diary < ApplicationRecord
  
  belongs_to :user
  attachment :image1, :image2, :image3
end
