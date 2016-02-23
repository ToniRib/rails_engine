class TransactionFinder
  def self.find_single(params)
    if params[:id]
      Transaction.find(params[:id])
    elsif params[:invoice_id]
      Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params[:result]
      Transaction.find_by(result: params[:result])
    elsif params[:created_at]
      Transaction.find_by("created_at = ?", params[:created_at])
    elsif params[:updated_at]
      Transaction.find_by("updated_at = ?", params[:updated_at])
    end
  end
end
