class RenameSessionsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :sport_sessions
  end
end
