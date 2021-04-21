class LikeController < ApplicationController
  def create
    like = @current_user.likes.build(study_id: params[:study_id])
    like.save
    redirect_to("/user/road/#{like.user_id}")
  end

  def destroy
    like = Like.find_by(study_id: params[:study_id],user_id: @current_user.id)
    like.delete
    redirect_to("/user/road/#{like.user_id}")
  end
end
