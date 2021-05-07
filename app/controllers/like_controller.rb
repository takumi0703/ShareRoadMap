class LikeController < ApplicationController
  def create
    study = Study.find_by(id: params[:study_id])
    like = @current_user.likes.build(study_id: params[:study_id])
    like.save
    flash[:success] = 'いいねしました！'
    redirect_to("/user/road/#{study.user_id}")
  end

  def destroy
    study = Study.find_by(id: params[:study_id])
    like = Like.find_by(study_id: params[:study_id], user_id: @current_user.id)
    like.delete
    redirect_to("/user/road/#{study.user_id}")
  end
end
