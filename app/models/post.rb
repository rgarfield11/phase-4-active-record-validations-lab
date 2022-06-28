class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbaity

    def title_is_clickbaity
        if title && title.match?(/Won't Believe/)
        elsif title && title.match?(/Secret/)
        elsif title && title.match?(/Top \d/)
        elsif title && title.match?(/Guess/)
        else errors.add(:title, "Sorry, this title is not clickbait-y enough.")
        end
    end
end
