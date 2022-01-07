class DeliveryTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '4~7日で発送' },
    { id: 3, name: '12日で発送' },
    { id: 4, name: '23日で発送' },
  ]  
  

  include ActiveHash::Associations
  has_many :products

  end