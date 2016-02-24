class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    respond_with Revenue.new(amount: Merchant.find(params[:merchant_id]).total_revenue(params[:date]))
  end
end
