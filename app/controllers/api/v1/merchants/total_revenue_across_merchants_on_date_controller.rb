class Api::V1::Merchants::TotalRevenueAcrossMerchantsOnDateController < ApplicationController
  respond_to :json

  def show
    respond_with get_revenue
  end

  private

  def get_revenue
    revenue = Merchant.total_revenue_on_date(params[:date])
    { "total_revenue" => revenue.to_s }.to_json
  end
end
