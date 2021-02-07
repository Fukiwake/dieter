class Favorite < ApplicationRecord
  
  belongs_to :diary
  belongs_to :user
  
end
