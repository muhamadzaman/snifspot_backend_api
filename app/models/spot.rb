class Spot < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :title, :description, :price, :images, presence: true
    validates :title, length: { maximum: 50 }
end
