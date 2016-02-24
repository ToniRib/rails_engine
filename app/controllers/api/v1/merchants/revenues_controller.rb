class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with total_revenue_on_date
    else
      respond_with total_revenue
    end
  end

  private

  def total_revenue
    total = InvoiceItem.total_revenue_for_merchant(params[:merchant_id])
    { "revenue" => total.to_s }.to_json
  end

  def total_revenue_on_date
    total = InvoiceItem.
            total_revenue_for_merchant_on_date(params[:merchant_id],
                                               params[:date])
    { "revenue" => total.to_s }.to_json
  end
end
