class GoalController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @roads = Goal.where(user_id: @user)
  end

end
