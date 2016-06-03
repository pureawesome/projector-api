require 'test_helper'

class DeleteProjectTest < ActionDispatch::IntegrationTest
  test 'delete project' do
    project1 = Project.create!(name: 'Test Project Edit',
                               description: 'Test Description')

    count = Project.count
    delete "/projects/#{project1.id}"

    assert_equal 204, response.status
    assert_equal Project.count, count - 1
  end
end
