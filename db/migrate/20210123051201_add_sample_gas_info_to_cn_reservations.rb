class AddSampleGasInfoToCnReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :cn_reservations, :sample_type, :string
    add_column :cn_reservations, :sample_weight, :string
    add_column :cn_reservations, :oxygen, :float
    add_column :cn_reservations, :argon, :float
  end
end
