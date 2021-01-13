module CommonReservation
  extend ActiveSupport::Concern

  def date_before_start
    errors.add(:base, "開始時間は過去の日付を選択できません．") if start_time < Time.now
  end

  def end_before_start
    errors.add(:base, "終了時間は開始時間以前を選択できません．") if end_time < start_time
  end

  def same_day_start_end
    errors.add(:base, "終了時間は開始時と同日である必要があります．") if start_time.year != end_time.year || start_time.month != end_time.month || start_time.day != end_time.day
  end

  def new_or_start_or_end_time_changed
    new_record? || will_save_change_to_start_time? || will_save_change_to_end_time?
  end
end