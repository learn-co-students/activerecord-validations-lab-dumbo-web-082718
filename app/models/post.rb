
class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {  :in => 20..300  }
  validates :summary, length: {  :maximum => 200  }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :is_clickbait



  def is_clickbait
    @valid_title = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if self.title && !@valid_title.find {|word| self.title.include? word}
      # binding.pry
      errors.add(:non_clickbait, 'not clickbait' )
    end
  end
end
