class Room < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :messages

  def self.search(search)
    if search != ""
      Room.where('text LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
