class Api::V1::RandomInvoiceItemController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.unscoped.order("RANDOM()").first
  end
end
