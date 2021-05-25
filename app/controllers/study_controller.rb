# frozen_string_literal: true

class StudyController < ApplicationController
  before_action :autheniticate_user, { only: %i[new edit completed_create completed_destroy] }
  before_action :not_set_current_user_study, { only: [:edit] }
  before_action :not_set_current_user_complete, { only: %i[completed_create completed_destroy] }
  before_action :set_study, { only: %i[completed_create completed_destroy edit update destroy] }
  def new
    @studies = Study.new
  end

  def create
    @studies = Study.new(study_params)
    tag_list = params[:tag_name].split(nil)#@studiesに関連したタグを取得、スペースで区切って配列化
    if @studies.save
      @studies.save_studies(tag_list)
      flash[:success] = '学習を追加しました！'
      redirect_to("/user/road/#{@studies.user_id}")
    else
      render('/study/new')
    end
  end
  def index
    @studies = Study.all.order_desc.includes(:user,:tag_maps,:tags)
    @user = User.all
    @tag_list = Tag.all
  end

  def completed_create
    completed = @study.update(completed: @current_user.id)
    flash[:success] = '達成おめでとう！!'
    redirect_to("/user/road/#{@study.user_id}")
  end

  def completed_destroy
    completed = @study.update(completed: nil)
    redirect_to("/user/road/#{@study.user_id}")
  end

  def edit; end

  def update
    @study.update(study_params)
    if @study.save
      flash[:success] = '学習を編集しました！'
      redirect_to("/user/road/#{@study.user_id}")
    else
      render('study/edit')
    end
  end

  def destroy
    if @study.destroy
      flash[:success] = '学習を削除しました！'
      redirect_to("/user/road/#{@study.user_id}")
    end
  end

  private

  def set_study
    @study = Study.find(params[:id])
  end

  def study_params
    params.permit(:content, :material, :period, :tag_list).merge(user_id: @current_user.id)
  end
end
