require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  before do
    @user = create(:user)
    visit login_path
    login_in_as @user
  end
  describe 'いいね機能' do
    before do
      visit '/study/new'
      fill_in 'content', with: 'テスト'
      click_button '作成'
      click_on '0'
    end
    context 'いいねされた時' do
      it 'クリック済みのCSSが適用されていること' do
        expect(page).to have_css '.liked'
      end
    end
    context 'いいねが解錠された時' do
      it '未クリックのCSSが適用されていること' do
        click_on '1'
        expect(page).to have_css '.like_btn'
      end
    end
  end
end
