class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_time_is_after_start_time



private

  def end_time_is_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "has to be after start time")
    end
  end

end
