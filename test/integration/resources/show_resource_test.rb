require 'test_helper'

class ShowResourceTest < ActionDispatch::IntegrationTest
  test 'show resource with content' do
    resource = Resource.create!(name: 'Test Resource 1',
                    description: 'Test Description')


    get resource_url(resource)

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal resource.name, JSON.parse(response.body)["name"]
  end
end
