require 'test_helper'

class ListResourcesTest < ActionDispatch::IntegrationTest
  test 'listing resources without content' do
    get '/resources', headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end

  test 'listing resources with content' do
    Resource.create!(name: 'Test Resource 1',
                    description: 'Test Description')
    Resource.create!(name: 'Test Resource 2',
                    description: 'Test 2 Description')

    get '/resources', headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal Resource.count, JSON.parse(response.body).size
  end
end
