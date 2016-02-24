class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  default_scope { order(id: :asc) }

  def successful_transactions
    transactions.where(result: "success")
  end

  def total_revenue
    successful_transactions.map do |t|
      t.invoice
    end
  end
end
