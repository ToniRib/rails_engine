require "faker"

FactoryGirl.define do
  factory :merchant do
    name Faker::Company.name
  end

  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence(5)
    unit_price 1000
    merchant
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
  end

  factory :invoice_item do
    item nil
    invoice nil
    quantity 1
    unit_price 1
  end

  factory :transaction do
    invoice nil
    credit_card_number "1234567812345678"
    credit_card_expiration_date "2016-02-22 14:17:27"
    result false
  end
end
