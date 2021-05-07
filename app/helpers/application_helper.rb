# frozen_string_literal: true

module ApplicationHelper
  def current_user?(_user)
    @current_user.id == @user.id
  end
end
