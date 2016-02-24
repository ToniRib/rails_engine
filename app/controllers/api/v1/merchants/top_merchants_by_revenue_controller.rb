class Api::V1::Merchants::TopMerchantsByRevenueController < ApplicationController
  respond_to :json

  def index
    # binding.pry <- this is being hit for the correct endpoint
  end
end
