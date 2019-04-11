class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true, length: { maximum: 10 }
end
