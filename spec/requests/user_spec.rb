require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '#new' do
    it '正常にレスポンスを返すこと' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
  describe '#index' do
    context 'ログインしていない時' do
      it 'ログイン画面にリダイレクトされていること' do
        get user_index_path
        expect(response).to redirect_to login_path
      end
    end
    context 'ログイン済みの時' do
      it '正常にレスポンスを返すこと' do
        get user_index_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
