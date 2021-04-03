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

  def edit
    @study =Study.find_by(id: params[:id])
  end

  def update
    @study = Study.find_by(id: params[:id])
    @study.content = params[:content]
    @study.material = params[:material]
    @study.period = params[:period]
    if @study.save
      flash[:success] = "学習内容が変更されました！"
      redirect_to("/users/road/#{@study.user_id}")
    else
      render("/study/#{@study.id}/edit")
    end
  end

  def destroy
    @study = Study.find_by(id: params[:id])
    if @study.destroy
      flash[:success] = "学習内容を削除しました！"
      redirect_to("/users/road/#{@study.user_id}")
    end
  end

end
