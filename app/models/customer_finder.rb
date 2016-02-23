class CustomerFinder
  def self.locate_one(params)
    Customer.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |k, _| customer_params.include?(k) }
  end

  def self.customer_params
    [
      :id,
      :first_name,
      :last_name,
      :created_at,
      :updated_at
    ]
  end
end
