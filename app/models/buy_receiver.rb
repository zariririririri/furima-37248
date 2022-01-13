class BuyReceiver
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :telephone_number, :city, :house_number, :prefecture_id,
                :buy_id, :building, :token

   validates  :user_id,            presence: true 
   validates  :product_id,         presence: true 
   validates  :post_code,          presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
                                  
   validates  :telephone_number,   presence: true 
   validates  :city,               presence: true 
   validates  :house_number,       presence: true 
   validates  :buy_id,             presence: true 
   validates  :prefecture_id,      presence: true,
                                   numericality: {other_than: 1, message: "can't be blank"}
  
  def save
   buy = Buy.create( user_id:user_id, product_id:product_id )
   Receiver.create( post_code:post_code, telephone_number:telephone_number, city:city, house_number:house_number,
                   prefecture_id:prefecture_id, buy_id:buy.id )
  end
 end