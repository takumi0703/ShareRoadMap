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
      flash[:notice] = "登録できたよ！"
      redirect_to("/users/#{@user.id}")
    else
      render("user/new")
    end
  end
  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
  end
  def show
    @user = User.find_by(id: params[:id])
  end
end
