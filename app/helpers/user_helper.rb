# frozen_string_literal: true

module UserHelper
  def goal_text(_user)
    if @user.goal.blank?
      'まだ決めていません！'
    else
      @user.goal
    end
  end
end
