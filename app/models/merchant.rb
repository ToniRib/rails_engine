class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  default_scope { order(id: :asc) }
end
