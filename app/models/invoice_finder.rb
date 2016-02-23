class InvoiceFinder
  def self.locate_one(params)
    Invoice.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |k, _| invoice_params.include?(k) }
  end

  def self.invoice_params
    [
      :id,
      :customer_id,
      :merchant_id,
      :status,
      :created_at,
      :updated_at
    ]
  end
end
