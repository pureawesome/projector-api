class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.integer :status
      t.integer :project_id
      t.references :projects, index: true, foreign_key: true
      t.integer :user_id
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
