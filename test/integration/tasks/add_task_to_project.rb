require 'test_helper'

class ShowTaskTest < ActionDispatch::IntegrationTest
  test 'add task to project' do
    project = Project.create!(name: 'Test Project 1',
                    description: 'Test Description')
    task = Task.create!(name: 'Test Task', description: 'Test Task Description', project_id: project.id, user_id: User.last.id)

    get project_url(project), headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal project.name, JSON.parse(response.body)["project"]["name"]
    assert_equal task.name, JSON.parse(response.body)["tasks"][0]["name"]
  end
end
