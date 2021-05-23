require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe '新規登録' do
    let(:user) { build(:user,:user1) }
    context '入力が正しい時' do
      it '登録時のフラッシュが表示されていること' do
        sign_in_as(user)
        expect(page).to have_content '新規登録が完了しました！'
      end
    end
  end
  describe 'ログイン' do
    let(:user)      { create(:user,:user1) }
    let(:next_user) { build(:user,:user2) }
    let(:study)     { create(:study) }
    let(:comment)   { create(:comment) }
    before do
      login_in_as user
    end
    context '入力が正しい時' do
      it 'ログインのフラッシュが表示されていること' do
        expect(page).to have_content 'ログインしました'
      end
    end
    describe 'ユーザー編集' do
      before do
        visit edit_user_path(user)
      end
      context '入力が正しい時' do
        it '編集完了のフラッシュが表示されていること' do
          user_update user
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
    describe 'ユーザー詳細画面のコメント一覧' do
      context 'コメントが届いたとき' do
        it 'ユーザーに届いたコメントのみが表示されていること' do
          visit logout_path
          next_user = create(:user,:user2)
          login_in_as(next_user)
          study_create study
          visit user_road_path(next_user)
          find('.comment-icon').click
          fill_in 'comment_content', with: 'ユーザー２が自分の学習にコメント'
          click_button '作成'
          visit user_path(user)
          expect(page).to_not have_content 'ユーザー２が自分の学習にコメント'
        end
      end
    end
  end
end
