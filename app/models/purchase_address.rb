class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :post_code, :user_id, :prefecture_id, :city, :street_number, :building_name, :phone_number, :purchase_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が無効です ハイフンを含めてください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください"}
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :token
  end


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end