class Lesson < ApplicationRecord
  belongs_to :language
  belongs_to :user
  has_many :interests, through: :user

  has_many :bookings, dependent: :delete_all

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

  pg_search_scope :search_by_interests,
  against: [ :id ],
  associated_against: {
    interests: [ :name ]
  },
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

  # def self.search_by_teacher_interests(query)
  #   interests.where('name @@ :query', query: query)
  # end

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
