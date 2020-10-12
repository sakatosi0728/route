require 'rails_helper'
describe RoomsController, type: :request do

  before do
    @room = FactoryBot.create(:room)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに作成済みのルームのテキストが存在する" do 
      get root_path
      expect(response.body).to include @room.text
    end
    it "indexアクションにリクエストするとレスポンスに作成済みのルームの画像URLが存在する" do 
      get root_path
      expect(response.body).to include @room.image
    end
    it "indexアクションにリクエストするとレスポンスにルーム検索フォームが存在する" do 
      get root_path
      expect(response.body).to include "ルームを検索する"
    end
  end
  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get room_path(@room)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに作成済みのルームのテキストが存在する" do 
      get room_path(@room)
      expect(response.body).to include @room.text
    end
    it "showアクションにリクエストするとレスポンスに作成済みのルームの画像URLが存在する" do 
      get room_path(@room)
      expect(response.body).to include @room.image
    end
    it "showアクションにリクエストするとレスポンスにメッセージ一覧表示部分が存在する" do 
      get room_path(@room)
      expect(response.body).to include "＜メッセージ一覧＞"
    end
  end 
end