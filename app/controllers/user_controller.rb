class UserController < ApplicationController
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
      redirect_to("/users/#{@user.id}")  
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("user/login_form")  
    end

  end
  def show
    @user = User.find_by(id: params[:id])
  end
end
