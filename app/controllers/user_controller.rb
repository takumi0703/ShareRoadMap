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
    @user.save
    redirect_to("/users/#{@user.id}")
  end

  def login
  end
  def show
    @user = User.find_by(id: params[:id])
  end
end
