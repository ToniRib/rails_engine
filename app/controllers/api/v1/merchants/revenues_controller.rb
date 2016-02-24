class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    respond_with total_revenue
  end

  private

  def total_revenue
    total = InvoiceItem.successful.joins(:invoice => :merchant).where("merchants.id = ?", params[:merchant_id]).sum("quantity * unit_price").to_f
    { "revenue" => total.to_s }.to_json
  end
end
