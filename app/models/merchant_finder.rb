class MerchantFinder
  def self.locate_one(params)
    Merchant.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |k, _| merchant_params.include?(k) }
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
