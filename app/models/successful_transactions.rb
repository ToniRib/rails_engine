require 'active_support/concern'

module SuccessfulTransactions
  extend ActiveSupport::Concern

  included do
    scope :successful_transactions, -> { joins(invoices: :transactions).merge(Transaction.successful) }
  end
end
