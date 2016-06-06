require 'test_helper'

class ShowTaskTest < ActionDispatch::IntegrationTest
  test 'add task to project' do
    project = Project.create!(name: 'Test Project 1',
                    description: 'Test Description')
    task = Task.create!(name: 'Test Task', description: 'Test Task Description', project_id: project.id)

    get project_url(project)

    assert_equal project1.name, JSON.parse(response.body)["name"]

  end
end
