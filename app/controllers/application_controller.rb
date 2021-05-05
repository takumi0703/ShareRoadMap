# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_current_user
  before_action :autheniticate_user, { only: %i[show edit index roadshow] }

  # ログインユーザー
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # 未ログインのアクセス制限
  def autheniticate_user
    if @current_user.nil?
      flash[:alert] = 'アクセス権限がありません'
      redirect_to(login_path)
    end
  end

  # ログイン中のアクセス制限
  def not_logout_user
    if @current_user
      flash[:alert] = 'ログアウトして下さい'
      redirect_to(user_index_path)
    end
  end

  # ログインユーザーとuser.idが違う場合のアクセス制限
  def not_set_current_user
    @user = User.find_by(id: params[:id])
    if @user.id != @current_user.id
      flash[:alert] = 'ログアウトして下さい'
      redirect_to(user_path(@current_user))
    end
  end

  # ログインユーザーとstudy.user_idが違う場合のアクセス制限
  def not_set_current_user_study
    @study = Study.find_by(id: params[:id])
    if @study.user_id != @current_user.id
      flash[:alert] = 'ログアウトして下さい'
      redirect_to(user_path(@current_user))
    end
  end

  # ログインユーザーとstudy.user_idが違う場合の警告
  def not_set_current_user_complete
    @study = Study.find_by(id: params[:id])
    if @study.user_id != @current_user.id
      flash[:alert] = 'ログインユーザーのみ操作できるよ'
      redirect_to("/user/road/#{@study.user_id}")
    end
  end


end
