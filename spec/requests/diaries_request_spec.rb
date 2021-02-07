require 'rails_helper'

RSpec.describe "Diaries", type: :request do
  let!(:diary) { create(:diary, title: "hoge", body: "body", weight: 80) }
  describe "投稿一覧のテスト" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end
  describe "投稿詳細のテスト" do
    it "responds successfully" do
      get :show, params: {id: id}
      expect(response).to be_successful
    end
    it "returns a 200 response" do
      get :show, params: {id: id}
      expect(response).to have_http_status "200"
    end
  end
  
end
