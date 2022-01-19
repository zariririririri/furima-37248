require 'rails_helper'

RSpec.describe BuyReceiver, type: :model do
  describe '商品購入機能の保存' do
    before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @buy_receiver = FactoryBot.build(:buy_receiver, user_id: user.id, product_id: product.id)
    sleep 1
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

  it 'priceとtokenがあれば保存ができること' do
    expect(@buy_receiver).to be_valid
  end
 end

context '内容に問題がある場合' do
  it 'post_codeが空だと保存できないこと' do
    @buy_receiver.post_code = ''
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Post codeを入力してください")
  end

  it '市区町村が空だと保存できないこと' do
    @buy_receiver.city = nil
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Cityを入力してください")
  end

  it '番地が空だと保存できないこと' do
    @buy_receiver.house_number = nil
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("House numberを入力してください")
  end

  it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @buy_receiver.post_code = '1234567'
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include('Post codeis invalid. Include hyphen(-)')
  end

  it 'prefectureを選択していないと保存できないこと' do
    @buy_receiver.prefecture_id = nil
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Prefectureを入力してください")
  end

  it 'prefecture-idの1を選択された場合保存できないこと' do
    @buy_receiver.prefecture_id = '1'
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Prefecturecan't be blank")
  end

  it 'telephone_numberが９桁以下では購入できない' do
    @buy_receiver.telephone_number = '09012356'
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include('Telephone numberは不正な値です')
  end

  it 'telephone_numberが空だと保存できない' do
    @buy_receiver.telephone_number = nil 
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Telephone numberを入力してください")
  end

  it 'telephone_numberは数値のみでしか保存できない' do
    @buy_receiver.telephone_number = '壱参伍'
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Telephone numberは不正な値です")
  end

  it 'productが紐付いていないと保存できないこと' do
    @buy_receiver.product_id = nil
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Productを入力してください")
  end

  it 'userが紐付いていないと保存できないこと' do
    @buy_receiver.user_id = nil
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Userを入力してください")
  end

  it 'tokenが空では登録できないこと' do
    @buy_receiver.token = ''
    @buy_receiver.valid?
    expect(@buy_receiver.errors.full_messages).to include("Tokenを入力してください")
  end
  end
 end 
end
