require 'rails_helper'

RSpec.describe 'Studies', type: :system do
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
    end
    describe '新規投稿' do
        context '正しい値が複数投稿された場合' do
            it '投稿数が増加していること' do
                expect {
                    click_link '追加'
                    fill_in "content", with:"テスト１"
                    click_button '作成'
                }.to change { Study.count }.by(1)
            end
        end
    end
    describe '編集' do
        context '正しい値で編集された時' do
            it '編集した値が表示されていること' do
                click_link '編集'
                fill_in "content", with:"テスト２"
                click_button '保存'
                expect(page).to have_content 'テスト２'
            end
        end
    end
    describe '削除' do
        context '正常に投稿が削除された時' do
            it '削除完了のフラッシュが表示されていること' do
                click_link '削除'
                expect(page).to have_content '学習を削除しました！'
            end
        end
    end
end
