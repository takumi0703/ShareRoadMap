# frozen_string_literal: true

class GuestSessionsController < ApplicationController
  def create
    user =
      User.find_or_create_by!(email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = 'guest'
    end
    session[:user_id] = user.id
    flash[:success] = 'ゲストユーザーとしてログインしました'
    redirect_to user_path(user)
  end
end
