class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :name
      t.integer :total_rows
      t.integer :total_columns

      t.timestamps
    end
  end
end
