class FindersController < ApplicationController
  
  def finder
    @users = User.all
    if params[:word].present?
      @users = @users.get_by_word(params[:word])
    end
    if params[:sex].present?
      @users = @users.get_by_sex(params[:sex])
    end
    if params[:height].present?
      @users = @users.get_by_height(params[:height])
    end
    if params[:weight].present?
      @users = @users.get_by_weight(params[:weight])
    end
    if params[:target_weight].present?
      @users = @users.get_by_target_weight(params[:target_weight])
    end
    if params[:age].present?
      @users = @users.get_by_age(params[:age])
    end
    if params[:diet_style1] == "1"
      @users = @users.get_by_style1(params[:diet_style1])
    end
    if params[:diet_style2] == "1"
      @users = @users.get_by_style2(params[:diet_style2])
    end
    if params[:diet_style3] == "1"
      @users = @users.get_by_style3(params[:diet_style3])
    end
    if params[:diet_style4] == "1"
      @users = @users.get_by_style4(params[:diet_style4])
    end
    @users = @users.page(params[:page]).reverse_order
    @diaries = Diary.looks(params[:word])
  end
  
end
