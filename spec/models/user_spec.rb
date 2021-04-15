require 'rails_helper'

RSpec.describe User, type: :model do
    describe "user新規登録" do
        context "全ての値が正しく入力されている時" do
            it "有効な状態であること" do
                user =User.new(
                    name:"hoge",
                    email:"hoge@example.com",
                    password:"password",
                )
                expect(user).to be_valid
            end
        end
        context "nameが空の時" do
            it "nameにエラーが含まれていること" do
                user = User.new(name: nil)
                user.valid?
                expect(user.errors[:name]).to include("を入力してください")
            end
        end
        context "emailが空の時" do
            it "emailにエラーが含まれていること" do
                user = User.new(email: nil)
                user.valid?
                expect(user.errors[:email]).to include("を入力してください")
            end
        end
        context "passwordが空の時" do
            it "nameにエラーが含まれていること" do
                user = User.new(password: nil)
                user.valid?
                expect(user.errors[:password]).to include("を入力してください")
            end
        end
    end

end
