class Api::V1::Items::TopItemsByMostSoldController < ApplicationController
  respond_to :json

  def index
    respond_with Item.top_by_most_sold(params[:quantity])
  end
end
