# encoding: utf-8

# This must be first!
require 'simplecov'
require 'coveralls'

if ENV['RAILS_ENV'] == 'test'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    Coveralls::SimpleCov::Formatter,
    SimpleCov::Formatter::HTMLFormatter
  ]
  SimpleCov.command_name 'RSpec'
  SimpleCov.start('rails') do
    # add_group 'Models', 'app/models'
    # add_group 'Controllers', 'app/controllers'
    # add_group 'Helpers', 'app/helpers'
    add_filter '.bundle'
  end
end

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'pathname'
require 'factory_girl_rails'
require 'json'
require 'jquery-rails'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    Timecop.return
    DatabaseCleaner.clean
  end

  config.include(ModelMacros, type: :model)
  config.include(ControllerMacros, type: :controller)

  # rspec-rails 3 will no longer automatically infer an example group's spec type
  # from the file location. You can explicitly opt-in to the feature using this
  # config option.
  # To explicitly tag specs without using automatic inference, set the `:type`
  # metadata manually:
  #
  #     describe ThingsController, :type => :controller do
  #       # Equivalent to being in spec/controllers
  #     end
  config.infer_spec_type_from_file_location!
end

# EOF
