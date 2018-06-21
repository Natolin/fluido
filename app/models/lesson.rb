class Lesson < ApplicationRecord
  belongs_to :language
  belongs_to :user

  validates :description, presence: true
  validates :price, presence: true


  include PgSearch

  pg_search_scope :search_by_language,
    against: [ :id ],
    associated_against: {
      language: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }


  pg_search_scope :search_by_price,
    against: [ :price ],
    using: {
      tsearch: { prefix: true }
    }
end
