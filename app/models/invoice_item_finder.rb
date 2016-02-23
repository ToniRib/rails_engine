class InvoiceItemFinder
  def self.find_single_invoice_item(params)
    if params[:id]
      InvoiceItem.find(params[:id])
    elsif params[:item_id]
      InvoiceItem.find_by(item_id: params[:item_id])
    elsif params[:invoice_id]
      InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      InvoiceItem.find_by(unit_price: params[:unit_price])
    elsif params[:created_at]
      InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      InvoiceItem.find_by(updated_at: params[:updated_at])
    end
  end
end
