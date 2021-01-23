class AddArgonInfoToIcpReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :icp_reservations, :argon_1, :string
    add_column :icp_reservations, :argon_2, :string
    add_column :icp_reservations, :argon_3, :string
    add_column :icp_reservations, :argon_4, :string
  end
end
