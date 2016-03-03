require "rails_helper"

RSpec.describe SuccessfulTransactions do
  class SuccessfulTransactionsTest < ActiveRecord::Base
    include SuccessfulTransactions
    has_many :transactions
  end

  it "should return only successful transactions" do
    expect(SuccessfulTransactionsTest.new.transactions).to eq([])
  end
end
