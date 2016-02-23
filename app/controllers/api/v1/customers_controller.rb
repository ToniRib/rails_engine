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
      Customer.find_by("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      Customer.find_by("last_name ILIKE ?", params[:last_name])
    elsif params[:created_at]
      Customer.find_by("created_at ILIKE ?", params[:created_at])
    elsif params[:updated_at]
      Customer.find_by("updated_at ILIKE ?", params[:updated_at])
    end
  end
end
