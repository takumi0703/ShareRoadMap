class LikeController < ApplicationController
  before_action :set_like_study, { only: %i[create destroy] }

  def create
    like = @current_user.likes.build(study_id: params[:study_id])
    like.save
    flash[:success] = 'いいねしました！'
    redirect_to("/user/road/#{@study.user_id}")
  end

  def destroy
    like = Like.find_by(study_id: params[:study_id], user_id: @current_user.id)
    like.delete
    redirect_to("/user/road/#{@study.user_id}")
  end

  private

  def set_like_study
    @study = Study.find_by(id: params[:study_id])
  end
end
