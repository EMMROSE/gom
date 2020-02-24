class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :location
      t.string :title
      t.string :description
      t.integer :capacity
      t.integer :level
      t.references :activity, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.boolean :open_status, default: :true

      t.timestamps
    end
  end
end
