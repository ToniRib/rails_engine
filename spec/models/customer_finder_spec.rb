require "rails_helper"

RSpec.describe CustomerFinder, type: :model do
  describe "#find_single" do
    it "finds single customer by id" do
      load_customers
      customer = CustomerFinder.find_single(id: 1)

      expect(customer.id).to eq(1)
      expect(customer.first_name).to eq("Toni")
      expect(customer.last_name).to eq("Rib")
    end

    it "finds single customer by first name" do
      load_customers
      customer = CustomerFinder.find_single(first_name: "Toni")
      expect(customer.id).to eq(1)
      expect(customer.first_name).to eq("Toni")
      expect(customer.last_name).to eq("Rib")

      customer = CustomerFinder.find_single(first_name: "Dan")
      expect(customer.id).to eq(3)
      expect(customer.first_name).to eq("Dan")
      expect(customer.last_name).to eq("Rib")
    end

    it "finds single customer by last name" do
      load_customers
      customer = CustomerFinder.find_single(last_name: "Rib")
      expect(customer.id).to eq(1)
      expect(customer.first_name).to eq("Toni")
      expect(customer.last_name).to eq("Rib")

      customer = CustomerFinder.find_single(last_name: "Aubrecht")
      expect(customer.id).to eq(2)
      expect(customer.first_name).to eq("Toni")
      expect(customer.last_name).to eq("Aubrecht")
    end

    it "finds single customer by created_at JSON string" do
      load_customers
      date = (Date.today - 2).to_json
      customer = CustomerFinder.find_single(created_at: date)
      expect(customer.id).to eq(1)
      expect(customer.created_at).to eq(Date.today - 2)
      expect(customer.first_name).to eq("Toni")

      date = (Date.today - 1).to_json
      customer = CustomerFinder.find_single(created_at: date)
      expect(customer.id).to eq(2)
      expect(customer.created_at).to eq(Date.today - 1)
      expect(customer.first_name).to eq("Toni")
    end

    it "finds single customer by updated_at JSON string" do
      load_customers
      date = (Date.today - 2).to_json
      customer = CustomerFinder.find_single(updated_at: date)
      expect(customer.id).to eq(1)
      expect(customer.updated_at).to eq(Date.today - 2)
      expect(customer.first_name).to eq("Toni")

      date = (Date.today - 1).to_json
      customer = CustomerFinder.find_single(updated_at: date)
      expect(customer.id).to eq(2)
      expect(customer.updated_at).to eq(Date.today - 1)
      expect(customer.first_name).to eq("Toni")
    end
  end

  describe "#find_multiple" do
    it "finds one customer by id" do
      load_customers
      customers = CustomerFinder.find_multiple(id: 1)

      expect(customers.first.id).to eq(1)
      expect(customers.first.first_name).to eq("Toni")
      expect(customers.first.last_name).to eq("Rib")
    end

    it "finds multiple customers by first name" do
      load_customers
      customers = CustomerFinder.find_multiple(first_name: "Toni")

      expect(customers.first.id).to eq(1)
      expect(customers.first.first_name).to eq("Toni")
      expect(customers.first.last_name).to eq("Rib")
      expect(customers.last.id).to eq(2)
      expect(customers.last.first_name).to eq("Toni")
      expect(customers.last.last_name).to eq("Aubrecht")
    end

    it "finds multiple customers by last name" do
      load_customers
      customers = CustomerFinder.find_multiple(last_name: "Rib")

      expect(customers.first.id).to eq(1)
      expect(customers.first.first_name).to eq("Toni")
      expect(customers.first.last_name).to eq("Rib")
      expect(customers.last.id).to eq(3)
      expect(customers.last.first_name).to eq("Dan")
      expect(customers.last.last_name).to eq("Rib")
    end

    it "finds multiple customers by created_at JSON string" do
      load_customers
      date = (Date.today - 2).to_json
      customers = CustomerFinder.find_multiple(created_at: date)

      expect(customers.first.id).to eq(1)
      expect(customers.first.first_name).to eq("Toni")
      expect(customers.first.last_name).to eq("Rib")
      expect(customers.last.id).to eq(3)
      expect(customers.last.first_name).to eq("Dan")
      expect(customers.last.last_name).to eq("Rib")
    end

    it "finds multiple customers by updated_at JSON string" do
      load_customers
      date = (Date.today - 2).to_json
      customers = CustomerFinder.find_multiple(updated_at: date)

      expect(customers.first.id).to eq(1)
      expect(customers.first.first_name).to eq("Toni")
      expect(customers.first.last_name).to eq("Rib")
      expect(customers.last.id).to eq(3)
      expect(customers.last.first_name).to eq("Dan")
      expect(customers.last.last_name).to eq("Rib")
    end
  end

  def load_customers
    create(:customer, id: 1,
                      first_name: "Toni",
                      last_name: "Rib",
                      created_at: Date.today - 2,
                      updated_at: Date.today - 2)
    create(:customer, id: 2,
                      first_name: "Toni",
                      last_name: "Aubrecht",
                      created_at: Date.today - 1,
                      updated_at: Date.today - 1)
    create(:customer, id: 3,
                      first_name: "Dan",
                      last_name: "Rib",
                      created_at: Date.today - 2,
                      updated_at: Date.today - 2)
  end
end
