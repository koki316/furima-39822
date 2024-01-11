class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postcode, :prefecture_id, :city, :street, :building, :tellnumber, :address_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :tellnumber, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :address_id
  end
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Addresss.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street: street, building: building, tellnumber: tellnumber, address_id: address.id)
  end
end