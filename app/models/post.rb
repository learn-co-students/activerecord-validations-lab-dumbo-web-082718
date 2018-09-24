class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, :length => {:minimum => 250}
  validates :summary, :length => {:maximum => 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

  def clickbait?
    strings = [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i]
    title = self.title || ""
    if strings.none? { |bait| bait.match(title) }
      errors.add(:title, "needs to be clickbai")
    end
  end
end
