class RoadController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @roads = Road.where(user_id: @user)
  end

end
