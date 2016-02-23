class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with find_merchant(params)
  end

  private

  def find_merchant(params)
    if params[:id]
      Merchant.find(params[:id])
    elsif params[:name]
      Merchant.find_by("name ILIKE ?", params[:name])
    elsif params[:created_at]
      Merchant.find_by("created_at ILIKE ?", params[:created_at])
    elsif params[:updated_at]
      Merchant.find_by("updated_at ILIKE ?", params[:updated_at])
    end
  end
end
