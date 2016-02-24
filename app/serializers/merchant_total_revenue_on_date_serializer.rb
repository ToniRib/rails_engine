class MerchantTotalRevenueOnDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    object['total_revenue'].to_f.to_s
  end
end
