# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    describe '正常値' do
      context '正しく入力されている時' do
        it '有効な状態であること' do
          user = build(:user, :user1)
          expect(user).to be_valid
        end
      end
      context 'passwordが6文字の時' do
        it '無効な状態であること' do
          user = build(:user, :user1, password: 'a'*6 )
          user.valid?
          expect(user).to be_valid
        end
      end
    end
    describe '不正な値' do
      context 'nameが空の時' do
        it 'nameにエラーが含まれていること' do
          user = build(:user, :user1, name: nil)
          user.valid?
          expect(user.errors[:name]).to include('を入力してください')
        end
      end
      context 'emailが空の時' do
        it 'emailにエラーが含まれていること' do
          user = build(:user, :user1, email: nil)
          user.valid?
          expect(user.errors[:email]).to include('を入力してください')
        end
      end
      context 'passwordが空の時' do
        it 'passwordにエラーが含まれていること' do
          user = build(:user, :user1, password: nil)
          user.valid?
          expect(user.errors[:password]).to include('を入力してください')
        end
      end
      context 'passwordが5文字の時' do
        it '無効な状態であること' do
          user = build(:user, :user1, password: 'a'*5 )
          user.valid?
          expect(user).to_not be_valid
        end
      end
      context '値が重複する時' do
        let!(:user) {create(:user,:user1)}
        context 'emailの値が重複する時' do
          let(:already_email) {build(:user,:already_email)}
          it 'emailにエラーが含まれていること' do
            already_email.valid?
            expect(already_email.errors[:email]).to include('はすでに存在します')
          end
        end
      end
    end
  end
end
