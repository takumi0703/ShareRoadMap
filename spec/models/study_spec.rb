require 'rails_helper'

RSpec.describe Study, type: :model do
  describe 'study新規作成' do
    context '正常な値の時' do
      context '全ての値が正しく入力されている時' do
        let!(:user) { create(:user, :user1) }
        it '有効な状態であること' do
          study = build(:study)
          expect(study).to be_valid
        end
      end
    end
    context '不正な値の時' do
      context 'contentが空の時' do
        it '無効な状態であること' do
          study = build(:study, content: nil)
          expect(study).to_not be_valid
        end
      end
      context 'user_idが空の時' do
        it '無効な状態であること' do
          study = build(:study, user_id: nil)
          expect(study).to_not be_valid
        end
      end
    end
  end
end
