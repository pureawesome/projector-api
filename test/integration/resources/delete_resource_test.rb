require 'test_helper'

class DeleteResourceTest < ActionDispatch::IntegrationTest
  test 'delete resource' do
    resource = Resource.create!(name: 'Test Resource Edit',
                               description: 'Test Description')

    count = Resource.count
    delete "/resources/#{resource.id}", headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 204, response.status
    assert_equal Resource.count, count - 1
  end
end
