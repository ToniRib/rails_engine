class ItemFinder
  def self.find_single(params)
    Item.find_by(params)
  end

  def self.find_multiple(params)
    Item.where(params)
  end
end
