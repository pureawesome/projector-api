require 'test_helper'

class ListProjectsTest < ActionDispatch::IntegrationTest
  test 'show project with content' do
    project1 = Project.create!(name: 'Test Project 1',
                    description: 'Test Description',
                    start_date: '2016-01-01',
                    project_end_date: '2016-12-31',
                    actual_end_date: '2016-12-01',
                    budget: 5000.00,
                    cost: 5500.00)

    get project_url(project1)

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal project1.name, JSON.parse(response.body)["name"]
  end
end
