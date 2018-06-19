class Conversation < ApplicationRecord
  has_many :messages
  #has_one or many subscription ?
  validates :title, presence: true
end
