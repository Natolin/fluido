class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :end_time_is_after_start_time
  validate :start_time_is_before_now


private

  def end_time_is_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "has to be after start time")
    end
  end

  def start_time_is_before_now
    if start_time.to_s[10,10]<= Time.now.to_s[10,10] && start_date <= Date.today
      errors.add(:start_time, "can't be earlier than now")
    end
  end
end
