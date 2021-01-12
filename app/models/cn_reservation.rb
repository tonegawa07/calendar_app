class CnReservation < ApplicationRecord
  include CommonReservation
  
  validates :lab, presence: true
  validates :name, presence: true

  validate :date_before_start
  validate :end_before_start
  validate :same_day_start_end
end
