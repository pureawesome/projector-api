require 'test_helper'

class DeleteProjectTest < ActionDispatch::IntegrationTest
  test 'delete project' do
    project1 = Project.create!(name: 'Test Project Edit',
                               description: 'Test Description')

    delete "/projects/#{project1.id}"
    # ,
    #   params: { name: 'Updated Title', value: 'Updated Description' }.to_json,
    #   headers: { 'Accept' => Mime[:json], 'Content-Type' => Mime[:json].to_s }

    get projects_url
    p JSON.parse(response.body)

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal 'Test Project Edit', JSON.parse(response.body)['name']
  end
end
