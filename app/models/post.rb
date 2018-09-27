class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait
end

private

def click_bait
#   arr = ["Won't Believe", "Secret", "Top
#   #{rand(0..1000)}", "Guess"]
# if self.title && !arr.any?{|item| self.title == item}
#   errors.add(:title, "Title is not clickbait-y")
#   end
# end
arr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if self.title && !arr.find {|item| self.title.include?(item)}
      # binding.pry
      errors.add(:title, 'The title is not clickbait-y' )
    end
  end

# def click_bait
#   @valid_title = ["Won't Believe", "Secret", "Top
#   [number]", or "Guess"]
#   errors.add(:title, "Not Clickbait-y")
# end
