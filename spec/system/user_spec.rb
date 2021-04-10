require 'rails_helper'

RSpec.describe "ユーザー" do
    describe "新規登録" do
        before do
            visit new_user_path
        end
        context '登録成功' do
            before do
                fill_in 'name',with:'name'
                fill_in 'email',with:'a@example.com'
                fill_in 'password',with:'password'
                click_button '登録'
            end
            it '全て正しい値であれば詳細ページへ遷移することを期待' do
                expect(page).to have_content '新規登録が完了しました！'
            end
        end
        context '登録失敗' do
            before do
                fill_in 'name',with: nil
                fill_in 'email',with:'a@example.com'
                fill_in 'password',with:'password'
                click_button '登録'
            end
            it 'ユーザー名が空だったら登録ボタンが再表示されることを期待' do
                expect(page).to have_button '登録'
            end
        end
    end
end




