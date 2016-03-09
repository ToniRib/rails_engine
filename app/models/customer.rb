class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  default_scope { order(id: :asc) }
  scope :successful_transactions, -> { joins(invoices: :transactions).merge(Transaction.successful) }

  def favorite_merchant
    merchants
      .select('id', 'name', 'COUNT(transactions.id) AS number_of_transactions' )
      .joins(:invoices => [:merchant, :transactions])
      .successful_transactions
      .group(:id)
      .reorder('number_of_transactions DESC')
      .take(1)
      .first
  end
end
