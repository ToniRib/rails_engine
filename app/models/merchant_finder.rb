class MerchantFinder
  def self.locate_one(params)
    Merchant.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |_, v| merchant_params.include?(v) }
  end

  def self.merchant_params
    [
      :id,
      :name,
      :created_at,
      :updated_at
    ]
  end
end
