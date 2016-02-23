class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    if invoice_params.empty?
      respond_with Invoice.all
    else
      respond_with InvoiceFinder.find_multiple(invoice_params)
    end
  end

  def show
    respond_with InvoiceFinder.find_single(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status,
                  :created_at, :updated_at)
  end
end
