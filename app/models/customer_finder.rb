class CustomerFinder
  def self.find_single(params)
    Customer.find_by(params)
  end

  def self.find_multiple(params)
    Customer.where(params)
  end
end
