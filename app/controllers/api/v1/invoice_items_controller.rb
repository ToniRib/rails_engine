class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    if invoice_item_params.empty?
      respond_with InvoiceItem.all
    else
      respond_with InvoiceItemFinder.find_multiple(invoice_item_params)
    end
  end

  def show
    respond_with InvoiceItemFinder.find_single(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price,
                  :created_at, :updated_at)
  end
end
