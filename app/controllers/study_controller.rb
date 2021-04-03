class StudyController < ApplicationController
  def new
    @studies = Study.new
  end

  def create
    @user = User.find_by(id: params[:id])
    @studies = Study.new(
      content: params[:content],
      material: params[:material],
      period: params[:period],
      user_id:  @current_user.id
    )
    if @studies.save
      flash[:success] = "学習内容が保存できました！"
      redirect_to("/users/road/#{@studies.user_id}")
    else
      render("/study/new")
    end
  end

end
