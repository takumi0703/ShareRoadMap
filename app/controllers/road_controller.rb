class RoadController < ApplicationController

  def show
    #ユーザー情報
    @user = User.find_by(id: params[:id])
    #user_idのgoalを取得
    @roads = Road.find_by(user_id: @user)
    @studies = Study.where(user_id: @user)
  end

end
