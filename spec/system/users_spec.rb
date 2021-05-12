require 'rails_helper'

RSpec.describe 'Users', type: :system do
    describe '新規登録' do
        before do
            @user = FactoryBot.build(:user)
        end
        context '入力が正しい時' do
            it '登録時のフラッシュが表示されていること' do
            visit '/'
            fill_in "name",with: @user.name
            fill_in "email", with: @user.email
            fill_in "password", with: @user.password
            click_button "登録"
            expect(page).to have_content '新規登録が完了しました！'
            end
        end
    end
    describe 'ログイン' do
        context '入力が正しい時' do
            before do
                @user = FactoryBot.create(:user)
            end
            it 'ログインのフラッシュが表示されていること' do
                visit login_path
                fill_in "email", with: @user.email
                fill_in "password", with: @user.password
                click_button "ログイン"
                expect(page).to have_content 'ログインしました'
            end
        end
    end
    describe 'ユーザー編集' do
        before do
            @user = FactoryBot.create(:user)
            visit login_path
            fill_in "email", with: @user.email
            fill_in "password", with: @user.password
            click_button "ログイン"
        end
        context '入力が正しい時' do
            it 'ユーザー名が編集されていること' do
                visit edit_user_path(@user)
                fill_in "name", with: 'test-name'
                click_button "保存"
                expect(page).to have_content 'test-name'
                expect(page).to have_content 'ユーザー情報を編集できました！'
            end
        end
        context 'ユーザー名が空の時' do
            it 'エラーメッセージが表示されていること' do
                visit edit_user_path(@user)
                fill_in "name", with: ''
                click_button "保存"
                expect(page).to have_content '編集に誤りがあります'
            end
        end
    end
end
