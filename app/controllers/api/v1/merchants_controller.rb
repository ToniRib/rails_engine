class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    if params[:id]
      respond_with Merchant.find(params[:id])
    elsif params[:name]
      respond_with Merchant.find_by(name: params[:name])
    end
  end
end
