require 'rails_helper'

RSpec.describe 'Tags', type: :system do
    describe '新規作成' do
        let(:user) { create(:user, :user1) }
        it '正しくタグが入力されている時、タグ名が表示されていること' do
            visit login_path
            login_in_as user
            visit new_study_path
            fill_in 'content', with: '投稿'
            fill_in 'tag_name', with: 'rails'
            click_button '作成'
            user_road_path(user)
            expect(page).to have_content 'rails'
        end
    end
end
