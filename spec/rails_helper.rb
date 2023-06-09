def coupon_data
  @merchant1 = Merchant.create!(name: "Hair Care")
  @merchant2 = Merchant.create!(name: "Jewelry")

  @coupon_1 = Coupon.create!(name: "Half Off", code: "HALFOFF", value: 0.5, merchant_id: @merchant1.id)
  @coupon_2 = Coupon.create!(name: "OMG it's FREE!", code: "FULLOFF", value: 1.0, merchant_id: @merchant1.id)
  @coupon_3 = Coupon.create!(name: "10% Off", code: "TENOFF", value: 0.10, merchant_id: @merchant1.id)
  @coupon_4 = Coupon.create!(name: "Five Dollars Off!", code: "5OFF", value: 5, merchant_id: @merchant1.id)
  @coupon_5 = Coupon.create!(name: "Two Dollars Off!", code: "2OFF", value: 2, merchant_id: @merchant1.id)
  @coupon_6 = Coupon.create!(name: "Ten Dollars Off!", code: "10OFF", value: 10, merchant_id: @merchant2.id)
  @coupon_7 = Coupon.create!(name: "50% Off!", code: "50%OFF", value: 0.5, merchant_id: @merchant2.id)
  @coupon_8 = Coupon.create!(name: "Three Bucks Off!", code: "3OFF", value: 3, merchant_id: @merchant2.id)
end

require "simplecov"
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
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
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
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
