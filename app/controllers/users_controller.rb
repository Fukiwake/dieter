class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.all.order(post_date: "ASC")
    @weights = @diaries.map(&:weight)
    @body_fat_percentages = @diaries.map(&:body_fat_percentage)
    @dates = @diaries.map{|diary| diary.post_date }
    if @dates[0] < @dates.last.prev_year
      @dates = @dates.select do |x|
        @dates.last.prev_year <= x
      end
      @weights = @weights.last(@dates.size)
      @body_fat_percentages = @body_fat_percentages.last(@dates.size)
    end
    @diary = Diary.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @diary = Diary.new
  end

end
