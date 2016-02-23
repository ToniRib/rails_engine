class Api::V1::RandomCustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.unscoped.order("RANDOM()").first
  end
end
