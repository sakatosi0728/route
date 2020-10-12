class Room < ApplicationRecord
  validates :text, presence: true
end
