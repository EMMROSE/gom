class AddCoordinatesToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :latitude, :float
    add_column :sessions, :longitude, :float
  end
end
