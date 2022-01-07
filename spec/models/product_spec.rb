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

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空では登録できない' do
        @product.explanation = ''
        @product.valid?

        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'categoryが空では登録できない' do
        @product.category = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'stateが空では登録できない' do
        @product.state = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("State can't be blank")
      end

      it 'deliveryが空では登録できない' do
        @product.delivery = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery can't be blank")
      end

      it 'prefectureが空では登録できない' do
        @product.prefecture = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'delivery_timeが空では登録できない' do
        @product.delivery_time = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end

      it 'priceが空では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは299では登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
