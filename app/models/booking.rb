class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true


  # def change_status(new_status)
  #   if new_status == "pending" || "accepted" || "declined"
  #     self.status = new_status
  #   else
  #     self.status = "pending"
  #   end
  # end

end
