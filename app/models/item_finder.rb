class ItemFinder
  def self.locate(params)
    params = sanitize(params)
    Item.find_by(params)
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
