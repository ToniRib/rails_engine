class MerchantsFavoriteCustomerSerializer < ActiveModel::Serializer
  attributes :id

  def id
    object.favorite_customer.id
  end
end
