class RenameColumnInSessionUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :session_users, :session_id, :sport_session_id
  end
end
