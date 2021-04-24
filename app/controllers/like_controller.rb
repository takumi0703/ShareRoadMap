class LikeController < ApplicationController
  before_action :study_params
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
