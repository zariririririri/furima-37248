require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能登録' do
    context '出品登録できる場合' do
      it '全ての項目が正しく入力されている時' do
        expect(@product).to be_valid
      end
    end

    context '出品登録できない場合' do
      it 'nameが空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end

      it 'explanationが空では登録できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("説明文を入力してください")
      end

      it 'categoryが空では登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを入力して下さい")
      end

      it 'stateが空では登録できない' do
        @product.state_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("状態を入力して下さい")
      end

      it 'deliveryが空では登録できない' do
        @product.delivery_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送場所を入力して下さい")
      end

      it 'prefectureが空では登録できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("都道府県を入力して下さい")
      end

      it 'delivery_timeが空では登録できない' do
        @product.delivery_time_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送日時を入力して下さい")
      end

      it 'priceが空では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('金額を入力してください')
      end

      it 'priceは299では登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額は300以上の値にしてください')
      end

      it '価格が、9999999円を超える場合は登録できない' do
        @product.price = '9999999999'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額は9999999以下の値にしてください')
      end

      it '価格に半角数字以外が含まれている場合は登録できない' do
        @product.price = '１２３'
        @product.valid?
        expect(@product.errors.full_messages).to include('金額は数値で入力してください')
      end

      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品画像を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
