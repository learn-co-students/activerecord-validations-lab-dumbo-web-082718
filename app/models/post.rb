class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait?, :something

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait?
    # CLICKBAIT.each do |clickbait|
    #   clickbait
    # end
    if CLICKBAIT.none?{|clickbait| clickbait.match title }
      errors.add(:title, "is clickbait-y")
    end
  end

  def something
  end
end
