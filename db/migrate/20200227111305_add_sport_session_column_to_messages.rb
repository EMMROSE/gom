class AddSportSessionColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :sport_session, index: true
    remove_column :messages, :chatroom_id
  end
end
