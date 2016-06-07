require 'test_helper'

class ShowResourceTest < ActionDispatch::IntegrationTest
  test 'show resource with content' do
    resource = Resource.create!(name: 'Test Resource 1',
                    description: 'Test Description')


    get resource_url(resource), headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal resource.name, JSON.parse(response.body)["resource"]["name"]
  end

  test 'show resource with booking' do
    resource = Resource.create!(name: 'Test Resource 1',
                    description: 'Test Description')
    project = Project.create!(name: 'Test Project 1',
                    description: 'Test Description')

    booking = Booking.create!(resource_id: resource.id, project_id: project.id)

    get resource_url(resource), headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal resource.name, JSON.parse(response.body)["resource"]["name"]
    assert_equal booking.id, JSON.parse(response.body)["bookings"][0]["id"]
  end
end
