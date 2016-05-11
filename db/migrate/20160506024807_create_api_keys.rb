class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys, id: false do |t|
      t.string :access_token, index: true, unique: true

      t.timestamps
    end
  end
end
