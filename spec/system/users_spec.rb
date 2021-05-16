require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '新規登録' do
    before do
      @user = build(:user)
    end
    context '入力が正しい時' do
      it '登録時のフラッシュが表示されていること' do
        sign_in_as @user
        expect(page).to have_content '新規登録が完了しました！'
      end
    end
  end
  describe 'ログイン' do
    before do
      @user = create(:user)
      login_in_as @user
    end
    context '入力が正しい時' do
      it 'ログインのフラッシュが表示されていること' do
        expect(page).to have_content 'ログインしました'
      end
    end
    describe 'ユーザー編集' do
      before do
        visit edit_user_path(@user)
      end
      context '入力が正しい時' do
        it '編集完了のフラッシュが表示されていること' do
          fill_in 'name', with: 'test-name'
          attach_file 'image_icon', 'app/assets/images/default.jpeg'
          fill_in 'email', with: 'test@example.com'
          fill_in 'goal', with: 'test-goal'
          click_button '保存'
          expect(page).to have_content 'ユーザー情報を編集できました！'
        end
      end
      context 'ユーザー名が空の時' do
        it 'エラーメッセージが表示されていること' do
          fill_in 'name', with: ''
          click_button '保存'
          expect(page).to have_content '編集に誤りがあります'
        end
      end
    end
  end
end
