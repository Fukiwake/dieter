class FindersController < ApplicationController
  
  def finder
    @users = User.all
    @users = User.looks(params[:word])
    @diaries = Diary.looks(params[:word])
  end
  
end
