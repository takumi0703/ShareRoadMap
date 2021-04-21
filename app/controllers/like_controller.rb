class LikeController < ApplicationController
  def create
    like = @current_user.likes.build(study_id: params[:study_id])
    like.save
    study = Study.find_by(id: params[:study_id])
    #likeのstudy_idと同じstudyのidをとってくる
    #study.idを持っているuserをとってくる
    redirect_to("/user/road/#{study.user_id}")
  end

  def destroy
    like = Like.find_by(study_id: params[:study_id],user_id: @current_user.id)
    like.delete
    study = Study.find_by(id: params[:study_id])
    redirect_to("/user/road/#{study.user_id}")
  end
end
