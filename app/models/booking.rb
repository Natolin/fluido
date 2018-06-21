class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true




  def start_time
        self.start_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
  # def change_status(new_status)
  #   if new_status == "pending" || "accepted" || "declined"
  #     self.status = new_status
  #   else
  #     self.status = "pending"
  #   end
  # end

end
