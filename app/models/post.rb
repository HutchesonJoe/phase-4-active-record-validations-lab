class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

  validate :title_is_clickbait

  def title_is_clickbait
    titles = ["Won't Believe", "Secret", "Top #{/\d/}", "Guess"]
    # byebug
    unless title && titles.any? {|word| title.include? (word)}
    errors.add(:title, "Not Click-baity enough!")
    end
  end

end
