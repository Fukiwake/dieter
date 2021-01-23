class DiariesController < ApplicationController
  
  def new
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user_id
    @diary.save
    redirect_to diary_path(@diary.id)
  end

  def edit
  end

  def show
  end

  def index
    @diaries = Diary.all
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:title, :body, :weight, :body_fat_percentage, :post_date, :image1, :image2, :image3)
  end
end
