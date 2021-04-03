class RoadController < ApplicationController

  def new
    @road = Road.new
  end

  def create
    @road = Road.new(
      goal: params[:goal],
      user_id: @current_user.id
    )
    if @road.save
      flash[:success] = "目標が決まりました！"
      redirect_to("/users/#{@road.user_id}")
    else
      render("road/new")
    end
  end

  def show
    #ユーザー情報
    @user = User.find_by(id: params[:id])
    #user_idのgoalを取得
    @road = Road.find_by(user_id: @user)
    @studies = Study.where(user_id: @user)
  end

  def edit
    @user = User.find_by(id: params[:id])
    @road = Road.find_by(user_id: @user)
  end

  def update
    @user = User.find_by(id: params[:id])
    @road = Road.find_by(user_id: @user)
    @road.goal = params[:goal]
    if @road.save
      flash[:success] = "目標が編集できました！"
      redirect_to("/users/#{@road.user_id}")
    end
  end

end
