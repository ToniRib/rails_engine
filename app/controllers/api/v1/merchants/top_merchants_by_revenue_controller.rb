class Api::V1::Merchants::TopMerchantsByRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.top_by_revenue(params[:quantity])
  end
end
