class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  #呼び出し。全てのコントローラで適用される
  before_action :set_current_user
  before_action :autheniticate_user,{only: [:show,:edit,:index]}
  
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

  #ログイン中のアクセス制限
  def not_logout_user
   if @current_user
     flash[:alert] = "ログアウトして下さい"
     redirect_to("/users/index")
   end
 end

 #ログインユーザーとuser.idが違う場合のアクセス制限
 def not_set_current_user
  @user = User.find_by(id: params[:id])
  if @user.id != @current_user.id
    flash[:alert] = "ログアウトして下さい"
    redirect_to("/users/#{@current_user.id}")
  end
 end
end
