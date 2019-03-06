class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :availability, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :price

      t.timestamps
    end
  end
end
