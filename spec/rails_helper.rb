# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end


  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end


  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end


  config.before(:each) do
    DatabaseCleaner.start
  end


  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include FactoryGirl::Syntax::Methods
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def load_merchants_with_transactions
  merchant1, merchant2, merchant3 = create_list(:merchant, 3)
  customer1, customer2, customer3 = create_list(:customer, 3)
  invoice1 = create(:invoice, merchant_id: merchant1.id,
                    created_at: Date.today - 1, customer_id: customer1.id)
  invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
  invoice3 = create(:invoice, merchant_id: merchant3.id, customer_id: customer3.id)
  item1 = create(:item, merchant_id: merchant1.id)
  item2 = create(:item, merchant_id: merchant2.id)
  item3 = create(:item, merchant_id: merchant3.id)
  invoice_item1 = create(:invoice_item, invoice_id: invoice1.id,
                         quantity: 1, unit_price: 200,
                         item_id: item1.id)
  invoice_item2 = create(:invoice_item, invoice_id: invoice2.id,
                         quantity: 2, unit_price: 300,
                         item_id: item2.id)
  invoice_item3 = create(:invoice_item, invoice_id: invoice3.id,
                         quantity: 3, unit_price: 400,
                         item_id: item3.id)
  transaction1 = create(:transaction, invoice_id: invoice1.id,
                        result: "success")
  transaction2 = create(:transaction, invoice_id: invoice2.id,
                        result: "success")
  transaction3 = create(:transaction, invoice_id: invoice3.id,
                        result: "success")

  [merchant1, merchant2, merchant3]
end
