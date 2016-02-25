class Api::V1::Items::TopItemsByRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Item.top_by_revenue(params[:quantity])
  end
end
