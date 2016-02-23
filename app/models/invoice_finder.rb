class InvoiceFinder
  def self.find_single_invoice(params)
    if params[:id]
      Invoice.find(params[:id])
    elsif params[:customer_id]
      Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:status]
      Invoice.find_by(status: params[:status])
    elsif params[:created_at]
      Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      Invoice.find_by(updated_at: params[:updated_at])
    end
  end
end
