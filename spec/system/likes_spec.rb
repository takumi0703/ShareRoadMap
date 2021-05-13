require 'rails_helper'

RSpec.describe 'Likes', type: :system do
    before do
        @user = FactoryBot.create(:user)
        visit login_path
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "ログイン"
    end
    it 'クリックされた時に赤くなっていること' do
        visit '/study/new'
        fill_in "content", with: "テスト"
        click_button '作成'
        click_on '0'
        expect(page).to have_css '.liked'
    end
    it 'クリックされた時に黒くなっていること' do
        visit '/study/new'
        fill_in "content", with: "テスト"
        click_button '作成'
        click_on '0'
        click_on '1'
        expect(page).to have_css '.like_btn'
    end
end
