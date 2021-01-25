require 'csv'

bom = "\uFEFF"

csv_data = CSV.generate(bom) do |csv|
  csv_column_names = %w(使用日 予約日 研究室名 使用者 サンプル数 開始時間 終了時間 アルゴン残量_1 アルゴン残量_2 アルゴン残量_3 アルゴン残量_4 備考)
  csv << csv_column_names
  @reservations.each do |reservation|
    csv_column_values = [
      reservation.start_time.strftime('%Y/%m/%d'),
      reservation.updated_at.strftime('%Y/%m/%d'),
      reservation.lab,
      reservation.name,
      reservation.number_of_samples,
      reservation.start_time.strftime('%H:%M'),
      reservation.end_time.strftime('%H:%M'),
      reservation.argon_1,
      reservation.argon_2,
      reservation.argon_3,
      reservation.argon_4,
      reservation.information
    ]
    csv << csv_column_values
  end
end
