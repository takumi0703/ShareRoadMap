# frozen_string_literal: true

module UserHelper

    def goal_text(user)
        if @user.goal.blank?
            "目標はまだ決めていません！"
        else
            @user.goal
        end
    end
end
