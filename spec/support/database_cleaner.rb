require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation
Rspec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
