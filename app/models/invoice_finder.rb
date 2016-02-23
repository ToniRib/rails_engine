class InvoiceFinder
  def self.find_single(params)
    Invoice.find_by(params)
  end

  def self.find_multiple(params)
    Invoice.where(params)
  end
end
