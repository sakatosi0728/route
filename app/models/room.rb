class Room < ApplicationRecord
  belongs_to :user
  has_many :messages

  validates :text, :image, presence: true

  def self.search(search)
    if search != ""
      Room.where('text LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
