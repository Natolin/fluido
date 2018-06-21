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
    # Shouldn't need tsearch for dropdowns
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_price,
    against: [ :price ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_teacher_name,
  against: [ :id ],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true }
  }


  # Country search needs autocomplete or something

  pg_search_scope :search_by_country,
    against: [ :id ],
    associated_against: {
      user: [ :country ]
    },
    using: {
      tsearch: { prefix: true }
    }




end
