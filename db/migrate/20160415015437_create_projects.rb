class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :project_end_date
      t.date :actual_end_date
      t.decimal :budget, precision: 9, scale: 2
      t.decimal :cost, precision: 9, scale: 2

      t.timestamps
    end
  end
end
