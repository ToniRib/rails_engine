class TransactionFinder
  def self.find_single(params)
    Transaction.find_by(params)
  end

  def self.find_multiple(params)
    Transaction.where(params)
  end
end
