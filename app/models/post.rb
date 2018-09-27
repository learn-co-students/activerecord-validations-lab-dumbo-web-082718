class Post < ActiveRecord::Base

validates :title, presence: true
validates :summary, length: { maximum: 250}
validates :content, length: {minimum: 250}
validates :category, inclusion: { in: ["Fiction","Non-Fiction"]} :message "lol"


  def is_clickbait
    @valid_title = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if self.title && !@valid_title.find {|word| self.title.include? word}
      # binding.pry
      errors.add(:non_clickbait, 'not clickbait' )
    end
  end
end
