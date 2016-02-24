class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  default_scope { order(id: :asc) }

  scope :successful, -> { joins(:transactions).where("transactions.result" => "success") }

  def self.sum_of_totals
    sum("quantity * unit_price").to_f
  end

  def self.invoices_created_on(date)
    where("invoices.created_at = ?", date)
  end

  def self.total_revenue_for_merchant(id)
    successful.joins(:invoice => :merchant).where("merchants.id = ?", id).sum_of_totals
  end

  def self.total_revenue_for_merchant_on_date(id, date)
    successful.invoices_created_on(date).joins(:invoice => :merchant).where("merchants.id = ?", id).sum_of_totals
  end
end
