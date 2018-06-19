class Language < ApplicationRecord
  has_many :languages

  validates :name, presence: true
end
