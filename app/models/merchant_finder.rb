class MerchantFinder
  def self.find_single_merchant(params)
    if params[:id]
      Merchant.find(params[:id])
    elsif params[:name]
      Merchant.find_by("name ILIKE ?", params[:name])
    elsif params[:created_at]
      Merchant.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Merchant.find_by(updated_at: params[:updated_at])
    end
  end
end
