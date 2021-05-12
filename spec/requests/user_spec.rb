require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '未ログイン' do
    context '#new' do
      it '正常にレスポンスを返すこと' do
        get '/'
        expect(response).to have_http_status(200)
      end
    end
    context '#index' do
    it 'ログイン画面にリダイレクトされていること' do
      get user_index_path
      expect(response).to redirect_to login_path
      end
    end
    context '#show' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/:id'
        expect(response).to redirect_to login_path
      end
    end
    context '#edit' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/:id/edit'
        expect(response).to redirect_to login_path
      end
    end
    context '#roadshow' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/road/:id'
        expect(response).to redirect_to login_path
      end
    end
  end
  describe 'ログイン済' do
    context '#index' do
        # it '正常にレスポンスを返すこと' do
        #   get user_index_path
        #   expect(response).to have_http_status(200)
        # end
    end
  end
end
