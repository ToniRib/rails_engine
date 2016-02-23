class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    if customer_params.empty?
      respond_with Customer.all
    else
      respond_with CustomerFinder.find_multiple(customer_params)
    end
  end

  def show
    respond_with CustomerFinder.find_single(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
