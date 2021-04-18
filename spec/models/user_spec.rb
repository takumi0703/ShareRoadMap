require 'rails_helper'

RSpec.describe User, type: :model do
    describe "user新規登録" do
        context "正常な値の時" do
            context "全ての値が正しく入力されている時" do
                it "有効な状態であること" do
                    user = FactoryBot.build(:user)
                    expect(user).to be_valid
                end
            end
        end
        context "不正な値の時" do
            context "nameが空の時" do
                it "nameにエラーが含まれていること" do
                    user = FactoryBot.build(:user,name: nil)
                    user.valid?
                    expect(user.errors[:name]).to include("を入力してください")
                end
            end
            context "emailが空の時" do
                it "emailにエラーが含まれていること" do
                    user = FactoryBot.build(:user,email: nil)
                    user.valid?
                    expect(user.errors[:email]).to include("を入力してください")
                end
            end
            context "passwordが空の時" do
                it "nameにエラーが含まれていること" do
                    user = FactoryBot.build(:user,password: nil)
                    user.valid?
                    expect(user.errors[:password]).to include("を入力してください")
                end
            end
        end
    end
end
