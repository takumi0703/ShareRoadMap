require 'rails_helper'

RSpec.describe 'Users', type: :system do
    it '新規登録が成功すること' do
    user = FactoryBot.build(:user)
    visit '/'
    fill_in "name",with: user.name
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "登録"
    expect(page).to have_content user.name
    end
end
