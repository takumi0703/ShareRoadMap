class LikeController < ApplicationController
  before_action :study_params

  # def create
  #   @study = Study.find_by(id: params[:study_id])
  #   like = @current_user.likes.build(study_id: params[:study_id])
  #   like.save
  #   redirect_to("/user/road/#{@study.user_id}")
  # end

  # def destroy
  #   study = Study.find_by(id: params[:study_id])
  #   like = Like.find_by(study_id: params[:study_id],user_id: @current_user.id)
  #   like.delete
  #   redirect_to("/user/road/#{@study.user_id}")
  # end

  def create
    Like.create(user_id: @current_user.id, study_id: params[:study_id])
  end

  def destroy
    Like.find_by(user_id: @current_user.id, study_id: params[:study_id]).destroy
  end

  private
  def study_params
    @study = Study.find_by(params[:user_id])
  end
end
