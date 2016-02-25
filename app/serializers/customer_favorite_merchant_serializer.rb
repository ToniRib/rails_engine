class CustomerFavoriteMerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  def id
    object.favorite_merchant.id
  end

  def name
    object.favorite_merchant.name
  end
end
