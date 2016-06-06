require 'test_helper'

class ShowProjectTest < ActionDispatch::IntegrationTest
  def setup
    user = User.create!(name:'test', email:'test@foo.com', password: 'test')
    @token = AuthToken.encode( {user_id: user.id} )
  end


  test 'show project with content' do
    project1 = Project.create!(name: 'Test Project 1',
                    description: 'Test Description',
                    start_date: '2016-01-01',
                    projected_end_date: '2016-12-31',
                    actual_end_date: '2016-12-01',
                    budget: 5000.00,
                    cost: 5500.00)

    get "/projects/#{project1.id}", headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
    assert_equal project1.name, JSON.parse(response.body)["project"]["name"]
  end
end
