class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.float :latitube
      t.float :longitube
      t.text :detail, null: false
      t.integer :planting
      t.integer :harvest
      t.string :crop
      t.text :remork
      t.string :image
      t.date :day, null: false

      t.timestamps
    end
  end
end
