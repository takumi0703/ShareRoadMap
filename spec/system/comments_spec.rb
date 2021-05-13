require 'rails_helper'

RSpec.describe 'Comments', type: :system do
    before do
        @user = FactoryBot.create(:user)
        visit login_path
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "ログイン"
        visit '/study/new'
        fill_in "content", with: "テスト"
        fill_in "material", with: "テスト"
        fill_in "period", with: "002021-04-01"
        click_button '作成'
        find('.comment-icon').click
    end
    describe '新規投稿' do
        context '正しい値の時' do
            it '投稿内容が表示されていること' do
                fill_in "comment_content", with: "テストコメント"
                click_button '作成'
                expect(page).to have_content 'コメントを投稿しました！'
            end
        end
        context 'コメントが空の時' do
            it 'エラーのフラッシュが表示されていること' do
                fill_in "comment_content", with: ""
                click_button '作成'
                expect(page).to have_content 'コメントに不備があります'
            end
        end
    end
    describe '編集' do
        before do
            fill_in "comment_content", with: "テストコメント"
            click_button '作成'
            click_on 'テストコメント'
            click_on '編集'
        end
        context '正しい値の時' do
            it '編集完了のフラッシュが表示されていること' do
                fill_in "comment_content", with: "編集テストコメント"
                click_on '保存'
                expect(page).to have_content 'コメントを編集しました！'
            end
        end
    end
    describe '削除' do
        before do
            fill_in "comment_content", with: "テストコメント"
            click_button '作成'
            click_on 'テストコメント'
        end
        context '正しく削除された時' do
            it '削除完了のフラッシュが表示されていること' do
                click_on '削除'
                expect(page).to have_content 'コメントを削除しました！'
            end
        end
    end
end
