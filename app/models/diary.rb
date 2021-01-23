class Diary < ApplicationRecord
  
  belongs_to :user
  attachment :image1
  attachment :image2
  attachment :image3
end
