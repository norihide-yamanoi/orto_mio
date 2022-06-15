class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :latitube, :latitude
    rename_column :events, :longitube, :longitude
  end
end
