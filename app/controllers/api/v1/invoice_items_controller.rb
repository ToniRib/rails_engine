class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItemFinder.locate_one(params)
  end
end
