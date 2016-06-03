require 'test_helper'

class ListProjectsTest < ActionDispatch::IntegrationTest
  test 'listing projects without content' do
    get '/projects'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end

  test 'listing projects with content' do
    Project.create!(name: 'Test Project 1',
                    description: 'Test Description',
                    start_date: '2016-01-01',
                    projected_end_date: '2016-12-31',
                    actual_end_date: '2016-12-01',
                    budget: 5000.00,
                    cost: 5500.00)
    Project.create!(name: 'Test Project 2',
                    description: 'Test 2 Description',
                    start_date: '2016-02-02',
                    projected_end_date: '2016-12-32',
                    actual_end_date: '2016-12-02',
                    budget: 2000.00,
                    cost: 2500.00)

    get '/projects'

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal Project.count, JSON.parse(response.body).size
  end
end
