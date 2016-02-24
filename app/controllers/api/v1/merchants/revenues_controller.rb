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
    total = InvoiceItem.successful.joins(:invoice => :merchant).where("merchants.id = ?", params[:merchant_id]).sum("quantity * unit_price").to_f
    { "revenue" => total.to_s }.to_json
  end

  def total_revenue_on_date
    total = InvoiceItem.successful.joins(:invoice => :merchant).where("invoices.created_at = ?", params[:date]).where("merchants.id = ?", params[:merchant_id]).sum("quantity * unit_price").to_f
    { "revenue" => total.to_s }.to_json
  end
end
