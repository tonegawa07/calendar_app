class IcpReservation < ApplicationRecord
  include CommonReservation
  
  validates :lab, presence: true
  validates :name, presence: true

  # validate :date_before_start
  validate :end_before_start
  validate :same_day_start_end
  validate :reservation_should_not_overlap, if: :new_or_start_or_end_time_changed
  
  def reservation_should_not_overlap
    errors.add(:base, "その時間帯には既に予約が入っています．") if IcpReservation.where('start_time < ?', end_time).where('end_time > ?', start_time).where.not(id: id).exists?
  end
end
