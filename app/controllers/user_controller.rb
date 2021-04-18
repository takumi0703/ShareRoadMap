class UserController < ApplicationController
  before_action :not_logout_user,{only: [:login_form,:new]}
  before_action :not_set_current_user,{only: [:edit]}
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(
    #   name: params[:name],
    #   email: params[:email],
    #   password: params[:password]
    # )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "新規登録が完了しました！"
      redirect_to(user_path(@user))
    else
      render(new_user_path)
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to(user_path(@user))  
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("user/login_form")  
    end
  end

  def index
    @users = User.all
  end

  def about
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if params[:image_icon]
      @user.image_icon = params[:image_icon]
    end
    if @user.save
     flash[:success] ="ユーザー情報を編集できました！"
     redirect_to(user_path(@user))
    else
      flash.now[:alert] ="編集に誤りがあります"
      render("/user/edit")
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to(login_path)
  end

  def roadshow
    @user = User.find(params[:id])
    @studies = Study.where(user_id: @user)
  end

  private
    def user_params
      params.permit(:name,:email,:goal,:password)
    end
end

