class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :package
      t.references :user, foreign_key: true
      t.references :tour_date, foreign_key: true

      t.timestamps
    end
  end
end
