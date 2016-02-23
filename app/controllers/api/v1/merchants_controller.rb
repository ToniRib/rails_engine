class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    if merchant_params.empty?
      respond_with Merchant.all
    else
      respond_with MerchantFinder.find_multiple(merchant_params)
    end
  end

  def show
    respond_with MerchantFinder.find_single(merchant_params)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
