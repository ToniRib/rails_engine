class MerchantFinder
  def self.find_single(params)
    Merchant.find_by(params)
  end

  def self.find_multiple(params)
    Merchant.where(params)
  end
end
