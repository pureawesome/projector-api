require 'test_helper'

class ShowBookingTest < ActionDispatch::IntegrationTest
  test 'add booking to project' do
    p 'testetestsetset'
    project = Project.create!(name: 'Test Project 1',
                              description: 'Test Description')
    resource = Resource.create!(name: 'Test Resource 1',
                              description: 'Test Description')
    booking = Booking.create!(project_id: project.id, resource_id: resource.id)

    get project_url(project), headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal project.name, JSON.parse(response.body)['project']['name']
    assert_equal booking.name, JSON.parse(response.body)['bookings'][0]['name']
  end
end
