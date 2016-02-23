class CustomerFinder
  def self.find_single(params)
    if params[:id]
      Customer.find(params[:id])
    elsif params[:first_name]
      Customer.find_by("first_name ILIKE ?", params[:first_name])
    elsif params[:last_name]
      Customer.find_by("last_name ILIKE ?", params[:last_name])
    elsif params[:created_at]
      Customer.find_by("created_at = ?", params[:created_at])
    elsif params[:updated_at]
      Customer.find_by("updated_at = ?", params[:updated_at])
    end
  end
end
