class DropTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :messages, :chatrooms
    drop_table :chatrooms
  end
end
