class Api::V1::Merchants::TopMerchantsByRevenueController < ApplicationController
  respond_to :json

  def index
    render nothing: true
  end
end
