require 'csv'

bom = "\uFEFF"

csv_data = CSV.generate(bom) do |csv|
  csv_column_names = %w(使用日 予約日 研究室名 使用者 サンプルの種類 サンプル数 サンプルの重量 開始時間 終了時間 酸素ガス残量 アルゴンガス残量 備考)
  csv << csv_column_names
  @reservations.each do |reservation|
    csv_column_values = [
      reservation.start_time.strftime('%Y/%m/%d'),
      reservation.updated_at.strftime('%Y/%m/%d'),
      reservation.lab,
      reservation.name,
      reservation.sample_type,
      reservation.number_of_samples,
      reservation.sample_weight,
      reservation.start_time.strftime('%H:%M'),
      reservation.end_time.strftime('%H:%M'),
      reservation.oxygen,
      reservation.argon,
      reservation.information
    ]
    csv << csv_column_values
  end
end
