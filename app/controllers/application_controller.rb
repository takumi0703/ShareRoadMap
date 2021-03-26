class ApplicationController < ActionController::Base
  #呼び出し。全てのコントローラで適用される
  before_action :set_current_user
  before_action :autheniticate_user,{only: [:show]}

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
end
