class CreateIcpReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :icp_reservations do |t|
      t.string :lab
      t.string :name
      t.integer :number_of_samples
      t.datetime :start_time
      t.datetime :end_time
      t.text :information

      t.timestamps
    end
  end
end
