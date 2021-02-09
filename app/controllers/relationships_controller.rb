class RelationshipsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
  end
end
