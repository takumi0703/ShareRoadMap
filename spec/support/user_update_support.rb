module UserUpdateSupport
    def user_update(_user)
      fill_in 'name', with: 'test-name'
      attach_file 'image_icon', 'app/assets/images/default.jpeg'
      fill_in 'email', with: 'test@example.com'
      fill_in 'goal', with: 'test-goal'
      click_button '保存'
    end
  end
  RSpec.configure do |config|
    config.include UserUpdateSupport
  end
