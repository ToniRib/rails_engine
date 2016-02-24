class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with Revenue.new(amount: total_revenue_on_date)
    else
      respond_with Revenue.new(amount: total_revenue)
    end
  end

  private

  def total_revenue
    InvoiceItem.total_revenue_for_merchant(params[:merchant_id])
  end

  def total_revenue_on_date
    InvoiceItem.total_revenue_for_merchant_on_date(params[:merchant_id], params[:date])
  end
end
