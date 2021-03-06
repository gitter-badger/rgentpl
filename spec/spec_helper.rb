TEMPLATE_ENV = 'test' unless defined?(TEMPLATE_ENV)

require 'rubygems'
require 'spork'
require 'pry'

require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  ENV['RUBY_ENV'] ||= 'test'

  unless ENV['DRB']
    require 'simplecov'
    require 'simplecov-gem-adapter'
    SimpleCov.start 'gem'
  end

  require 'rspec'
  require 'rspec/autorun'
  require 'capybara'

  require File.dirname(__FILE__) + '/../config/environment'

  # Load support files
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

  # Include main application module
  include Rgentpl

  RSpec.configure do |config|
    config.include Rgentpl::Helper::Assertions

    config.mock_with :rspec

    config.order = 'random'
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  unless ENV['DRB']
    require 'simplecov'
    require 'simplecov-gem-adapter'
    SimpleCov.start 'gem'
  end
end
