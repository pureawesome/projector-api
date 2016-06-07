require 'test_helper'

class ShowBookingTest < ActionDispatch::IntegrationTest
  test 'deleting project deletes booking' do
    project = Project.create!(name: 'Test Project 1',
                              description: 'Test Description')
    resource = Resource.create!(name: 'Test Resource 1',
                              description: 'Test Description')
    booking = Booking.create!(project_id: project.id, resource_id: resource.id)
    booking2 = Booking.create!(project_id: project.id, resource_id: resource.id)

    get project_url(project), headers: { 'Authorization' => "Bearer #{@token}" }

    resource_count = Booking.count

    delete "/projects/#{project.id}", headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 204, response.status
    assert_equal Booking.count, resource_count - 2
  end
end
