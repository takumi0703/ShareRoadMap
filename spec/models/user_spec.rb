# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    context '全ての値が正しく入力されている時' do
      it '有効な状態であること' do
        user = build(:user, :user1)
        expect(user).to be_valid
      end
    end
    context '不正な値' do
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
      context '値が重複する時' do
        let!(:user) {create(:user,:user1)}
        context 'nameの値が重複する時' do
          let(:already_name) {build(:user,:already_name)}
          it 'nameにエラーが含まれていること' do
            already_name.valid?
            expect(already_name.errors[:name]).to include('はすでに存在します')
          end
        end
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
