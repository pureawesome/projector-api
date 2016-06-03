require 'test_helper'

class EditResourceTest < ActionDispatch::IntegrationTest
  test 'edit resource with content' do
    resource = Resource.create!(name: 'Test Resource Edit',
                               description: 'Test Description')

    put "/resources/#{resource.id}",
      params: { name: 'Updated Title', value: 'Updated Description' }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 'Updated Title', JSON.parse(response.body)['name']
  end
end
