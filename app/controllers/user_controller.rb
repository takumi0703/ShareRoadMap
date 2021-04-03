class UserController < ApplicationController
  before_action :not_logout_user,{only: [:login_form,:new]}
  before_action :not_set_current_user,{only: [:edit]}
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_icon: "mateo-avila-chinchilla-x_8oJhYU31k-unsplash.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "新規登録が完了しました！"
      redirect_to("/users/#{@user.id}")
    else
      render("user/new")
    end
  end
  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to("/users/#{@user.id}")  
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("user/login_form")  
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to("/login")
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.goal = params[:goal]
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image_icon]
      #名前の保存
      @user.image_icon = "#{@user.id}.jpg"
      image = params[:image_icon]
      #フォルダに保存
      File.binwrite("public/image/#{@user.image_icon}",File.read(image))
    end
    
    if @user.save
     flash[:success] ="ユーザー情報を編集できました！"
     redirect_to("/users/#{@user.id}")
    else
      flash.now[:alert] ="編集に誤りがあります"
      render("/user/edit")
    end
  end

  #RoadAction

  def roadshow
    @user = User.find_by(id: params[:id])
    @studies = Study.where(user_id: @user)
  end

end

