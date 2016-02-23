class Api::V1::RandomMerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.unscoped.order("RANDOM()").first
  end
end
