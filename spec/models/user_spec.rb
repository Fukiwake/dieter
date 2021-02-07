require "rails_helper"

RSpec.describe "Userモデルのテスト", type: :model do
  it "保存するテスト" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:user, name: "")).to_not be_valid
  end
  it "名前が1文字だと登録できない" do
    user_name = Faker::Lorem.characters(number: 1)
    expect(FactoryBot.build(:user, name: user_name)).to_not be_valid
  end
  it "名前が21文字以上だと登録できない" do
    user_name = Faker::Lorem.characters(number: 21)
    expect(FactoryBot.build(:user, name: user_name)).to_not be_valid
    end
end