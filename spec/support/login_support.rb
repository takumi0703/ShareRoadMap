module LoginSupport
    def login_in_as(user)
        visit login_path
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "ログイン"
    end
    def sign_in_as(user)
        visit '/'
        fill_in "name",with: @user.name
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "登録"
    end
end

RSpec.configure do |config|
    config.include LoginSupport
end
