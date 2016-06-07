require 'test_helper'

class ShowTaskTest < ActionDispatch::IntegrationTest
  test 'deleting project deletes task' do
    project = Project.create!(name: 'Test Project 1',
                    description: 'Test Description')
    task = Task.create!(name: 'Test Task', description: 'Test Task Description', project_id: project.id, user_id: User.last.id)
    task2 = Task.create!(name: 'Test Task', description: 'Test Task Description', project_id: project.id, user_id: User.last.id)

    get project_url(project), headers: { 'Authorization' => "Bearer #{@token}" }

    task_count = Task.count

    delete "/projects/#{project1.id}", headers: { 'Authorization' => "Bearer #{@token}" }

    assert_equal 204, response.status
    assert_equal Task.count, task_count - 2
  end
end
