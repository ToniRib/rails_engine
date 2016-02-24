class Api::V1::Merchants::TopMerchantsByRevenueController < ApplicationController
  respond_to :json

  def index
    # binding.pry # <- this is being hit for the correct endpoint
  end

  private

  def top_revenue
    totals = InvoiceItem.successful.joins(:invoice => :merchant).sum("quantity * unit_price")
    { "revenue" => total.to_s }.to_json
  end
end
