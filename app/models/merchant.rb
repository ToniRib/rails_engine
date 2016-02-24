class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  default_scope { order(id: :asc) }

  def invoices_with_successful_transactions
    invoices.joins(:transactions, :invoice_items).where("result = 'success'")
  end

  def total_revenue(date = nil)
    scoped = invoices_with_successful_transactions
    scoped = scoped.where("invoices.created_at = ?", date) if date
    scoped.sum("unit_price * quantity").to_f
  end

  def favorite_customer
    customers.select('customers.id', 'COUNT(transactions.id) AS number_of_transactions').joins(:invoices => [:merchant, :transactions]).where("result='success'").group(:id).reorder('number_of_transactions DESC').take(1).first
  end
end
