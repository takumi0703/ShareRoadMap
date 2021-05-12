require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '#new' do
    context '未ログイン' do
      it '正常にレスポンスを返すこと' do
        get '/'
        expect(response).to have_http_status(200)
      end
    end
  end
  describe '#index' do
    context '未ログイン' do
      it 'ログイン画面にリダイレクトされていること' do
        get user_index_path
        expect(response).to redirect_to login_path
      end
    end
    context 'ログイン時' do
       # it '正常にレスポンスを返すこと' do
        #   get user_index_path
        #   expect(response).to have_http_status(200)
        # end
    end
  end
  describe '#show' do
    context '未ログイン' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/:id'
        expect(response).to redirect_to login_path
      end
    end
  end
  describe '#edit' do
    context '未ログイン' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/:id/edit'
        expect(response).to redirect_to login_path
      end
    end
  end
  describe '#roadshow' do
    context '未ログイン' do
      it 'ログイン画面にリダイレクトされていること' do
        get '/user/road/:id'
        expect(response).to redirect_to login_path
      end
    end
  end
end
