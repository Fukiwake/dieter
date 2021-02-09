class DiaryCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @diary_comment = DiaryComment.new
    @diary = Diary.find(params[:diary_id])
    @comment = current_user.diary_comments.new(diary_comment_params)
    @comment.diary_id = @diary.id
    @comment.save
  end

  def destroy
    @diary = Diary.find(params[:diary_id])
    DiaryComment.find_by(id: params[:id], diary_id: params[:diary_id]).destroy
  end

  private

  def diary_comment_params
    params.require(:diary_comment).permit(:comment)
  end

end
