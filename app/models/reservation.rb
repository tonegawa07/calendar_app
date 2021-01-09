class Reservation < ApplicationRecord
  validates :lab, presence: true
  validates :name, presence: true

  validate :date_before_start
  validate :end_before_start
  validate :same_day_start_end

  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end

  def end_before_start
    errors.add(:end_time, "は開始時間以前を選択できません") if end_time < start_time
  end

  def same_day_start_end
    errors.add(:end_time, "は開始時と同日である必要があります") if start_time.year != end_time.year || start_time.month != end_time.month || start_time.day != end_time.day
  end
end
