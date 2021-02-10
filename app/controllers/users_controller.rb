class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries
    week_date = (0..6).to_a.map {|i| (Date.today - i.days)}.reverse
    weight = (0..6).to_a.map {|i|
      diary = @user.diaries.find_by(post_date: Date.today - i.days)
      if diary.present?
        diary.weight
      else
        previous_diary = @user.diaries.where("post_date <= ?", Date.today - i.days).last
        previous_diary.weight
      end
    }.reverse
    @deta = [week_date, weight].transpose
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
