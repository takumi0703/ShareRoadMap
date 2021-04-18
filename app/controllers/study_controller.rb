class StudyController < ApplicationController
  before_action :autheniticate_user,{only: [:new,:edit]}
  before_action :not_set_current_user_study,{only: [:edit]}
  def new
    @studies = Study.new
  end

  def create
    @studies = Study.new(study_params)
    if @studies.save
      flash[:success] = "学習を追加しました！"
      redirect_to("/user/road/#{@studies.user_id}")
    else
      render("/study/new")
    end
  end

  def edit
    @study =Study.find(params[:id])
  end

  def update
    @study = Study.find(params[:id])
    @study.update(study_params)
    if @study.save
      flash[:success] = "学習を編集しました！"
      redirect_to("/user/road/#{@study.user_id}")
    else
      render("study/edit")
    end
  end

  def destroy
    @study = Study.find(params[:id])
    if @study.destroy
      flash[:success] = "学習を削除しました！"
      redirect_to("/user/road/#{@study.user_id}")
    end
  end
  
  private
    def study_params
      params.permit(:content,:material,:period).merge(user_id: @current_user.id)
    end
end
