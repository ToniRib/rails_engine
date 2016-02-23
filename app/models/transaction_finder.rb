class TransactionFinder
  def self.locate_one(params)
    Transaction.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |k, _| transaction_params.include?(k) }
  end

  def self.transaction_params
    [
      :id,
      :invoice_id,
      :credit_card_number,
      :result,
      :created_at,
      :updated_at
    ]
  end
end
