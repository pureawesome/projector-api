require 'test_helper'

class EditProjectTest < ActionDispatch::IntegrationTest
  test 'edit project with content' do
    project1 = Project.create!(name: 'Test Project Edit',
                               description: 'Test Description')

    put "/projects/#{project1.id}",
      params: { name: 'Updated Title', value: 'Updated Description' }.to_json,
      headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s, 'Authorization' => "Bearer #{@token}"  }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 'Updated Title', JSON.parse(response.body)['name']
  end
end
