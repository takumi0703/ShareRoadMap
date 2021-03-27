class ApplicationController < ActionController::Base
  #呼び出し。全てのコントローラで適用される
  before_action :set_current_user
  before_action :autheniticate_user,{only: [:show,:edit]}
  before_action :not_set_current_user,{only: [:edit]}
>>>>>>> feature

  #ログインユーザー
  def set_current_user
   @current_user = User.find_by(id: session[:user_id]) 
  end

  #未ログインのアクセス制限
  def autheniticate_user
   if @current_user==nil
     flash[:alert] = "アクセス権限がありません"
     redirect_to("/login")
   end
 end
<<<<<<< HEAD
=======
 
 def not_set_current_user
  @user = User.find_by(id: params[:id])
  if @user.id != @current_user.id
    flash[:alert] = "ログアウトして下さい"
    redirect_to("/users/#{@current_user.id}")
  end
 end
>>>>>>> feature
end
