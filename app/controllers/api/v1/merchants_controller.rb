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
      Merchant.where("name ILIKE ?", params[:name]).first
    end
  end
end
