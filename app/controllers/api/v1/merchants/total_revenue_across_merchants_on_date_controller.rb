class Api::V1::Merchants::TotalRevenueAcrossMerchantsOnDateController < ApplicationController
  def show
    render json: Merchant.total_revenue_on_date(params[:date]),
           serializer: ::MerchantTotalRevenueOnDateSerializer
  end
end
