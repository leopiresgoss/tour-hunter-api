class CreateTourDates < ActiveRecord::Migration[7.0]
  def change
    create_table :tour_dates do |t|
      t.date :date
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
