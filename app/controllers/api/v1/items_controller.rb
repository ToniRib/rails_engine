class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with find_item(params)
  end

  private

  def find_item(params)
    if params[:id]
      Item.find(params[:id])
    elsif params[:name]
      Item.find_by("name ILIKE ?", params[:name])
    elsif params[:description]
      Item.find_by("description ILIKE ?", params[:description])
    elsif params[:unit_price]
      Item.find_by(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      Item.find_by(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      Item.find_by("created_at ILIKE ?", params[:created_at])
    elsif params[:updated_at]
      Item.find_by("updated_at ILIKE ?", params[:updated_at])
    end
  end
end
