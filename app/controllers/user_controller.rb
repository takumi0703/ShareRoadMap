# frozen_string_literal: true

class UserController < ApplicationController
  before_action :not_logout_user, { only: %i[login_form new] }
  before_action :not_set_current_user, { only: [:edit] }
  before_action :set_user, { only: %i[show edit update roadshow] }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = '新規登録が完了しました！'
      redirect_to(user_path(@user))
    else
      render(new_user_path)
    end
  end

  def login_form; end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'ログインしました'
      redirect_to(user_path(@user))
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('user/login_form')
    end
  end

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @study = Study.find_by(user_id: @user.id)
    @comments = Comment.all.order_desc.eager_load(:user, :study)
  end

  def edit; end

  def update
    @user.update(user_params)
    @user.image_icon = params[:image_icon] if params[:image_icon]
    if @user.save
      flash[:success] = 'ユーザー情報を編集できました！'
      redirect_to(user_path(@user))
    else
      flash.now[:alert] = '編集に誤りがあります'
      render('/user/edit')
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to(login_path)
  end

  def roadshow
    @studies = Study.where(user_id: @user).order_asc
    @tag_list = Tag.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :goal, :password, :image_icon)
  end
end
