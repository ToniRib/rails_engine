class InvoiceItemFinder
  def self.find_single(params)
    InvoiceItem.find_by(params)
  end

  def self.find_multiple(params)
    InvoiceItem.where(params)
  end
end
