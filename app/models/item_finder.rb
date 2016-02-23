class ItemFinder
  def self.locate_one(params)
    Item.find_by(sanitize(params))
  end

  def self.sanitize(params)
    params.select { |_, v| item_params.include?(v) }
  end

  def self.item_params
    [
      :id,
      :name,
      :description,
      :unit_price,
      :merchant_id,
      :created_at,
      :updated_at
    ]
  end
end
