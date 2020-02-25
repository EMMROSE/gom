class ChangeLevelToSessions < ActiveRecord::Migration[6.0]
  def change
    change_column :sessions, :level, :string
  end
end
