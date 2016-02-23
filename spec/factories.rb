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
    unit_price Faker::Number.number(5)
    merchant
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
  end

  factory :invoice_item do
    item
    invoice
    quantity Faker::Number.number(1)
    unit_price Faker::Number.number(5)
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Business.credit_card_number.gsub!("-", "")
    result
  end

  sequence :result, %w(success failed).cycle do |n|
    n
  end
end
