class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with InvoiceFinder.find_single_invoice(params)
  end
end
