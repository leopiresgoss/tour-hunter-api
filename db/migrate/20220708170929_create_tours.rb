class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :location
      t.text :description
      t.float :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
