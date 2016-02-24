require "faker"

FactoryGirl.define do
  factory :merchant do
    name
    created_at Date.today
    updated_at Date.today
  end

  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    created_at Date.today
    updated_at Date.today
  end

  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence(5)
    unit_price
    merchant
    created_at Date.today
    updated_at Date.today
  end

  factory :invoice do
    customer
    merchant
    status "shipped"
    created_at Date.today
    updated_at Date.today
  end

  factory :invoice_item do
    item
    invoice
    quantity Faker::Number.number(1)
    unit_price
    created_at Date.today
    updated_at Date.today
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Business.credit_card_number.gsub!("-", "")
    result
    created_at Date.today
    updated_at Date.today
  end

  sequence :result, %w(success failed).cycle do |n|
    n
  end

  sequence :unit_price do |i|
    "#{i}.00"
  end

  sequence :name do |n|
    "name#{n}"
  end
end
