class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :flight_id
      t.string :origin
      t.string :destination
      t.date :date
      t.integer :airplane_id

      t.timestamps
    end
  end
end
