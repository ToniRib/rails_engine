require "rails_helper"

RSpec.describe Item, type: :model do
  describe ".top_by_revenue" do
    it "returns the top x items by total revenue" do
      load_merchants_with_transactions

      item1, item2 = Item.top_by_revenue(2)

      expect(item1.id).to eq(Item.last.id)
      expect(item2.id).to eq(Item.second.id)
    end
  end

  describe ".top_by_most_sold" do
    it "returns the top x items by total quantity sold" do
      load_merchants_with_transactions

      item1, item2 = Item.top_by_most_sold(2)

      expect(item1.id).to eq(Item.last.id)
      expect(item2.id).to eq(Item.second.id)
    end
  end

  describe "#best_day" do
    it "returns the datetime the item sold the most by revenue" do
      load_merchants_with_transactions

      item1_best_day = Item.first.best_day.created_at
      item2_best_day = Item.second.best_day.created_at
      item3_best_day = Item.third.best_day.created_at

      expect(item1_best_day).to eq(Date.today - 1)
      expect(item2_best_day).to eq(Date.today)
      expect(item3_best_day).to eq(Date.today)
    end
  end
end
