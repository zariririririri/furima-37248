require 'rails_helper'

RSpec.describe BuyReceiver, type: :model do
  describe '商品購入機能の保存' do
    before douser = FactoryBot.create(:user)
    @buy_receiver = FactoryBot.build(:buy_receiver, receiver_id: receiver.id)
end

context '内容に問題がない場合' do
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@buy_receiver).to be_valid
  end

  it '都道府県が必要なこと' do
    @buy_receiver.prefecture_id = '6'
        expect(@buy_receiver).to be_valid
  end

  it '市区町村が必要なこと' do
    @buy_receiver.city = '港区'
        expect(@buy_receiver).to be_valid
  end

  it '番地が必要なこと' do
    @buy_receiver.house_number = '2-36'
        expect(@buy_receiver).to be_valid
  end

  it 'building_nameは空でも保存できること' do
    @buy_receiver.building = ''
        expect(@buy_receiver).to be_valid
  end

  it 'telephone_numberが必要なこと' do
    @buy_receiver.telephone_number = '09012345678'
        expect(@buy_receiver).to be_valid
  end
end

context '内容に問題がある場合' do
  it 'post_codeが空だと保存できないこと' do
    @buy_receiver.post_code = ''
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Post code can't be blank")
  end

  it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @buy_receiver.post_code = '1234567'
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
  end

  it 'prefectureを選択していないと保存できないこと' do
    @buy_receiver.prefecture = 0
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'telephone_numberは、10桁以上11桁以内の半角数値のみ保存可能なこと' do
    @buy_receiver.telephone_number = '0901234567890' 
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Price is not a number")
  end

  it 'buyが紐付いていないと保存できないこと' do
    @buy_receiver.buy = nil
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include('Buy must exist')
  end
end
end