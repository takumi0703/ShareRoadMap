require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like新規作成' do
    before do
      create(:user, :user1)
      create(:study)
    end
    context '正常な値の時' do
      context '全ての値が正しく入力されている時' do
        it '有効な状態であること' do
          comment = build(:comment)
          expect(comment).to be_valid
        end
      end
    end
    context '不正な値の時' do
      context 'user_idが空の時' do
        it '無効な状態であること' do
          comment = build(:comment, user_id: nil)
          expect(comment).to_not be_valid
        end
      end
      context 'study_idが空の時' do
        it '無効な状態であること' do
          comment = build(:comment, study_id: nil)
          expect(comment).to_not be_valid
        end
      end
      context 'comment_contentが空の時' do
        it '無効な状態であること' do
          comment = build(:comment, comment_content: nil)
          expect(comment).to_not be_valid
        end
      end
    end
  end
end
