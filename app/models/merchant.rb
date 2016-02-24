class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  default_scope { order(id: :asc) }

  def self.top_by_revenue(num)
    select_id_name_and_revenue.joins(:invoices => [:transactions,
                                                   :invoice_items])
                              .where("result='success'")
                              .group(:id)
                              .reorder('total_revenue DESC')
                              .take(num.to_i)
  end

  def self.top_by_number_of_items_sold(num)
    select_id_name_and_number_of_items
      .joins(:invoices => [:merchant, :transactions, :invoice_items])
      .where("result='success'")
      .group(:id)
      .reorder('number_of_items DESC')
      .take(num.to_i)
  end

  def self.total_revenue_on_date(date)
    select('SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue')
      .joins(:invoices => [:invoice_items, :transactions])
      .where("result = 'success'")
      .where("invoices.created_at = ?", date)
      .reorder('total_revenue')
      .first
  end

  def total_revenue(date = nil)
    scoped = invoices_with_successful_transactions
    scoped = scoped.where("invoices.created_at = ?", date) if date
    scoped.sum("unit_price * quantity").to_f
  end

  def favorite_customer
    scoped = customers_with_successful_transactions
    scoped.group(:id).reorder('number_of_transactions DESC').take(1).first
  end

  private

  def self.select_id_name_and_revenue
    select("id",
           "name",
           "SUM(invoice_items.unit_price * invoice_items.quantity) AS total_revenue")
  end

  def self.select_id_name_and_number_of_items
    select("id",
           "name",
           "SUM(invoice_items.quantity) AS number_of_items")
  end

  def invoices_with_successful_transactions
    invoices.joins(:transactions, :invoice_items).where("result = 'success'")
  end

  def customers_with_successful_transactions
    customers.select('customers.id',
                     'COUNT(transactions.id) AS number_of_transactions')
             .joins(invoices: :transactions).where("result = 'success'")
  end
end
