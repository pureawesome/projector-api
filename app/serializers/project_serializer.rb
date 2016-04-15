class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_date, :project_end_date, :actual_end_date, :budget, :cost
end
