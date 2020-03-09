class AddStatusToSessionUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :session_users, :status, :string, default: 'pending'
  end
end
