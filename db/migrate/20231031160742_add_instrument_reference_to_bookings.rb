class AddInstrumentReferenceToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :instrument, null: false, foreign_key: true
    add_reference :reviews, :user, null: false, foreign_key: true
  end
end
