class Room < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :messages
end
