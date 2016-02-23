class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    if transaction_params.empty?
      respond_with Transaction.all
    else
      respond_with TransactionFinder.find_multiple(transaction_params)
    end
  end

  def show
    respond_with TransactionFinder.find_single(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :result,
                  :created_at, :updated_at)
  end
end
