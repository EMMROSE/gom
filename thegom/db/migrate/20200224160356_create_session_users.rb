class CreateSessionUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :session_users do |t|
      t.references :session, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :owner
      t.boolean :equipped

      t.timestamps
    end
  end
end
