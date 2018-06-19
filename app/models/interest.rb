class Interest < ApplicationRecord
  validates :name, uniqueness: true
end
