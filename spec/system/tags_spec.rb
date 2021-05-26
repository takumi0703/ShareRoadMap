require 'rails_helper'

RSpec.describe 'Tags', type: :system do
    let(:user) { create(:user, :user1) }
    before do
        visit login_path
        login_in_as user
        visit new_study_path
        fill_in 'content', with: '投稿'
    end
    it 'タグが大文字で入力された場合でも、小文字で表示されていること' do
        fill_in 'tag_name', with: 'RAILS'
        click_button '作成'
        user_road_path(user)
        expect(page).to have_content 'rails'
    end
    it 'タグ一覧のタグをクリックされた時、そのタグ名が表示されていること' do
        fill_in 'tag_name', with: 'rails'
        click_button '作成'
        visit study_index_path
        expect(page).to have_content 'rails'
    end
    context 'タグ絞り込み' do
        it 'タグをクリックされた時、そのタグに関連していない学習は表示されないこと' do
            fill_in 'tag_name', with: 'rails'
            click_button '作成'
            visit new_study_path
            fill_in 'content', with: 'phpの学習投稿'
            fill_in 'tag_name', with: 'php'
            click_button '作成'
            visit study_index_path
            click_link 'rails'
            expect(page).to_not have_content 'phpの学習投稿'
        end
    end
    describe '編集' do
        before do
            fill_in 'content', with: '投稿'
            fill_in 'tag_name', with: 'rails'
            click_button '作成'
            click_on '編集'
        end
        it '正しく編集された時、そのタグが表示されていること' do
            fill_in 'tag_name', with: 'ruby'
            click_button '保存'
            expect(page).to have_content 'ruby'
        end
        it '編集された時、削除されたタグは表示されていないこと' do
            fill_in 'tag_name', with: 'ruby'
            click_button '保存'
            expect(page).to_not have_content 'rails'
        end
    end
end
