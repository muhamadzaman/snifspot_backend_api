class Review < ApplicationRecord
    validates :rating, :review_comment, presence: true
    validates :review_comment, length: { maximum: 100 }

    belongs_to :spot
end
