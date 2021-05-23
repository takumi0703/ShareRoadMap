require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let(:user) { create(:user, :user1) }
  before do
    login_in_as user
    study_create @study
    find('.comment-icon').click
  end
  describe '新規投稿' do
    context '正しい値の時' do
      it '投稿内容が表示されていること' do
        comment_create @comment
        expect(page).to have_content 'コメントを投稿しました！'
      end
    end
    context 'コメントが空の時' do
      it 'エラーのフラッシュが表示されていること' do
        fill_in 'comment_content', with: ''
        click_button '作成'
        expect(page).to have_content 'コメントに不備があります'
      end
    end
  end
  describe '編集、削除' do
    before do
      comment_create @comment
      click_on 'テストコメント'
    end
    context '正しい値の時' do
      it '編集完了のフラッシュが表示されていること' do
        click_on '編集'
        fill_in 'comment_content', with: '編集テストコメント'
        click_on '保存'
        expect(page).to have_content 'コメントを編集しました！'
      end
    end
    context '正しく削除された時' do
      it '削除完了のフラッシュが表示されていること' do
        click_on '削除'
        expect(page).to have_content 'コメントを削除しました！'
      end
    end
  end
end
