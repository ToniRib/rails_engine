class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  default_scope { order(id: :asc) }

  def successful_transactions
    transactions.where(result: "success")
  end
end
