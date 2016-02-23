class Api::V1::RandomTransactionController < ApplicationController
  respond_to :json

  def show
    respond_with Transaction.unscoped.order("RANDOM()").first
  end
end
