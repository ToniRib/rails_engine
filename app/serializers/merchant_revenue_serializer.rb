class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    sum("quantity * unit_price").to_json
  end
end
