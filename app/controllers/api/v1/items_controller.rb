class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    if item_params.empty?
      respond_with Item.all
    else
      respond_with ItemFinder.find_multiple(item_params)
    end
  end

  def show
    respond_with ItemFinder.find_single(item_params)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id,
                  :created_at, :updated_at)
  end
end
