class Customer < ActiveRecord::Base
  has_many :invoices

  default_scope { order(id: :asc) }
end
