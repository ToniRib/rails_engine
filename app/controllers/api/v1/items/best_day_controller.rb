class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find(params[:item_id]).best_day
  end
end
