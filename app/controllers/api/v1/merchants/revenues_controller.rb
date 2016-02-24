class Api::V1::Merchants::RevenuesController < ApplicationController
  def show
    render json: Merchant.find(params[:merchant_id]),
           serializer: ::MerchantRevenueSerializer, date: params[:date]
  end
end
