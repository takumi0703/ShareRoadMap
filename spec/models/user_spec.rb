# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user新規登録' do
    context '正常な値の時' do
      context '全ての値が正しく入力されている時' do
        it '有効な状態であること' do
          user = build(:user,:user1)
          expect(user).to be_valid
        end
      end
    end
    context '不正な値の時' do
      context 'nameが空の時' do
        it 'nameにエラーが含まれていること' do
          user = build(:user ,:user1,name: nil)
          user.valid?
          expect(user.errors[:name]).to include('を入力してください')
        end
      end
      context 'emailが空の時' do
        it 'emailにエラーが含まれていること' do
          user = build(:user,:user1, email: nil)
          user.valid?
          expect(user.errors[:email]).to include('を入力してください')
        end
      end
      context 'passwordが空の時' do
        it 'nameにエラーが含まれていること' do
          user = build(:user,:user1,password: nil)
          user.valid?
          expect(user.errors[:password]).to include('を入力してください')
        end
      end
      context '値が重複する時' do
        before do
          User.create(
            name: 'test',
            email: 'test@example.com',
            password: 'test'
          )
        end
        context 'nameの値が重複する時' do
          it 'nameにエラーが含まれていること' do
            user = User.new(
              name: 'test',
              email: 'test1@example.com',
              password: 'test1'
            )
            user.valid?
            expect(user.errors[:name]).to include('はすでに存在します')
          end
        end
        context 'emailの値が重複する時' do
          it 'emailにエラーが含まれていること' do
            user = User.new(
              name: 'test1',
              email: 'test@example.com',
              password: 'test1'
            )
            user.valid?
            expect(user.errors[:email]).to include('はすでに存在します')
          end
        end
      end
    end
  end
end
