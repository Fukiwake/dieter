class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).reverse_order
    @diary = Diary.new
  end
  
end
