class Api::V1::Merchants::TopMerchantsByItemsSoldController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.top_by_number_of_items_sold(params[:quantity])
  end
end
