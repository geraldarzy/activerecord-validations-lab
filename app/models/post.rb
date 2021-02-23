class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum:250}
    validates :summary, length: { maximum:250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :clickbait_title?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]
    
    def clickbait_title?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    end
    
end
