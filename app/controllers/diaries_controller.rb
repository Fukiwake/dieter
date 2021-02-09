class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, ]

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    @diary.save
    current_user.update(weight: @diary.weight)
    redirect_to diaries_path
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to diary_path(diary.id)
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to diaries_path
  end

  def show
    @diary = Diary.find(params[:id])
    @new_diary = Diary.new
    @diary_comment = DiaryComment.new
    @user = @diary.user
  end

  def index
    @diaries = Diary.all
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body, :weight, :body_fat_percentage, :post_date, :image1, :image2, :image3)
  end
end
