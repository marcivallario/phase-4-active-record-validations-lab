class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :no_click_bait

    def no_click_bait
        if title && !title.include?("Won't Believe" || "Secret" ||"Guess" ||"Top [number]")
          errors.add(:title, "Not clickbait")
        end
    end

end
