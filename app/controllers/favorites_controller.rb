class FavoritesController < ApplicationController
  
  def create
    @diary = Diary.find(params[:diary_id])
    favorite = current_user.favorites.new(diary_id: params[:diary_id])
    favorite.save
  end
  
  def destroy
    @diary = Diary.find(params[:diary_id])
    favorite = Favorite.find_by(diary_id: params[:diary_id])
    favorite.destroy
  end
  
end
