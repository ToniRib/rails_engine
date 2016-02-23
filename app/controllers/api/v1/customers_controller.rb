class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with find_customer(params)
  end

  private

  def find_customer(params)
    if params[:id]
      Customer.find(params[:id])
    elsif params[:first_name]
      Customer.where("first_name ILIKE ?", params[:first_name]).first
    elsif params[:last_name]
      Customer.where("last_name ILIKE ?", params[:last_name]).first
    end
  end
end
