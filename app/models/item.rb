class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(id: :asc) }

  def self.top_by_revenue(num)
    select('id', 'name', 'SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue')
      .joins(invoice_items: [:invoice, :transactions])
      .where("result='success'")
      .group(:id)
      .reorder('total_revenue DESC')
      .take(num)
  end

  def self.top_by_most_sold(num)
    select('id', 'name', 'SUM(invoice_items.quantity) AS total_sold')
      .joins(invoice_items: [:invoice, :transactions])
      .where("result='success'")
      .group(:id)
      .reorder('total_sold DESC')
      .take(num)
  end

  def best_day
    invoices
      .select("invoices.created_at", "SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
      .joins(:transactions)
      .where("result='success'")
      .group('created_at')
      .reorder('total_revenue DESC')
      .take(1)
      .first
  end
end
