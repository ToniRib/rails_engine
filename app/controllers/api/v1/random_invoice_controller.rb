class Api::V1::RandomInvoiceController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.unscoped.order("RANDOM()").first
  end
end
