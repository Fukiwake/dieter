class DiariesController < ApplicationController

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    redirect_to diaries_path
  end

  def edit
    @diary = Diary.find(params[:id])
  end
  
  def update
  end
  
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def index
    @diaries = Diary.all
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body, :weight, :body_fat_percentage, :post_date, :image1, :image2, :image3)
  end
end
