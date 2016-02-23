class ItemFinder
  def self.find_single(params)
    if params[:id]
      Item.find(params[:id])
    elsif params[:name]
      Item.find_by("name ILIKE ?", params[:name])
    elsif params[:description]
      Item.find_by("description ILIKE ?", params[:description])
    elsif params[:unit_price]
      Item.find_by("unit_price = ?", params[:unit_price])
    elsif params[:merchant_id]
      Item.find_by("merchant_id = ?", params[:merchant_id])
    elsif params[:created_at]
      Item.find_by("created_at = ?", params[:created_at])
    elsif params[:updated_at]
      Item.find_by("updated_at = ?", params[:updated_at])
    end
  end

  def self.find_multiple(params)
    if params[:id]
      Item.where("id = ?", params[:id])
    elsif params[:name]
      Item.where("name ILIKE ?", params[:name])
    elsif params[:description]
      Item.where("description ILIKE ?", params[:description])
    elsif params[:unit_price]
      Item.where("unit_price = ?", params[:unit_price])
    elsif params[:merchant_id]
      Item.where("merchant_id = ?", params[:merchant_id])
    elsif params[:created_at]
      Item.where("created_at = ?", params[:created_at])
    elsif params[:updated_at]
      Item.where("updated_at = ?", params[:updated_at])
    end
  end
end
