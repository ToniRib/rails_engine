class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice

  default_scope { order(id: :asc) }

  scope :successful, -> { joins(:transactions).where("transactions.result" => "success") }
end
