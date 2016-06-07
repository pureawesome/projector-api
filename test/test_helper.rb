ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
require 'minitest/pride'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  setup :auth_token

  def auth_token
    user = User.create!(name:'test', email:'test@foo.com', password: 'test')
    @token = AuthToken.encode( {user_id: user.id} )
  end

  # Add more helper methods to be used by all tests here...
  Minitest::Reporters.use!(
    Minitest::Reporters::ProgressReporter.new,
    ENV,
    Minitest.backtrace_filter)
end
