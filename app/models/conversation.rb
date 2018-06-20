class Conversation < ApplicationRecord
  has_many :messages
  has_many :subscriptions
  has_many :users, through: :subscriptons
  #has_one or many subscription ?
  validates :title, presence: true
end
