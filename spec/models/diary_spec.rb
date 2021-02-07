require 'rails_helper'

RSpec.describe 'Diaryモデルのテスト', type: :model do
  it "保存するテスト" do
    expect(FactoryBot.build(:diary)).to be_valid
  end
  it "現在の体重がなければ登録できない" do
    expect(FactoryBot.build(:diary, weight: "")).to_not be_valid
  end
  
end