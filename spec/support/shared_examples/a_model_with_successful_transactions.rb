shared_examples_for "a model with successful transactions" do
  let(:model) { described_class }

  it "returns only transactions that are successful" do
    attribute_name = model.name.downcase.to_sym

    merchant_with_successful_transaction, merchant_with_failed_transaction = create_list(attribute_name, 2)
    invoice1 = create(:invoice, attribute_name => merchant_with_successful_transaction)
    invoice2 = create(:invoice, attribute_name => merchant_with_failed_transaction)
    transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
    transaction2 = create(:transaction, invoice_id: invoice2.id, result: "failed")

    # binding.pry
    expect(model.successful_transactions.count).to eq(1)
    expect(model.successful_transactions.first).to eq(merchant_with_successful_transaction)
  end
end
