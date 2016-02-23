class InvoiceItemFinder
  def self.locate_one(params)
    InvoiceItem.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |k, _| invoice_params.include?(k) }
  end

  def self.invoice_params
    [
      :id,
      :item_id,
      :invoice_id,
      :quantity,
      :unit_price,
      :created_at,
      :updated_at
    ]
  end
end
