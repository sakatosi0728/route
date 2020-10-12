require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ツイートの保存' do
    context "ツイートが保存できる場合" do
      it "画像とテキストがあればツイートは保存される" do
        expect(@room).to be_valid
      end
    end
    context "ツイートが保存できない場合" do
      it "テキストがないとツイートは保存できない" do
        @room.text = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Text can't be blank")
      end     
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("User must exist")
      end
    end
  end
end