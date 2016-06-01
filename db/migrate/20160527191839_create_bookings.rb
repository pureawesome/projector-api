class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :project_id
      t.integer :resource_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.references :project, index: true, foreign_key: true
      t.references :resource, index: true, foreign_key: true
    end
  end
end
