class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.belongs_to :user, null: false, foreign_key: true

      t.float :distance
      t.integer :duration_hours
      t.integer :duration_minutes
      t.integer :duration_seconds
      t.float :elevation
      t.string :category, null: false, default: :cycling
      t.string :title
      t.datetime :start_time
      t.text :description
      t.string :ride_type, null: false, default: :activity

      t.timestamps
    end
  end
end
