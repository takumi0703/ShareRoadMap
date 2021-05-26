require 'rails_helper'

RSpec.describe Tag, type: :model do
    it 'タグが正しく入力された時、有効な状態であること' do
        tag = build(:tag)
        tag.valid?
        expect(tag).to be_valid
    end
    it 'タグが複数入力された時、配列の数が2つになっていること' do
        tag = build(:tag,:tag_list)
        tag.valid?
        num = tag.tag_name.split(/[[:blank:]]+/)
        expect(num.size).to eq 2
    end
end
