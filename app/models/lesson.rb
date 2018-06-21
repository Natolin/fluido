class Lesson < ApplicationRecord
  belongs_to :language
  belongs_to :user

  has_many :bookings, dependent: :delete_all

  validates :description, presence: true
  validates :price, presence: true

  include PgSearch

  pg_search_scope :global_search,
    against: [ :id],
    associated_against: {
      language: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
