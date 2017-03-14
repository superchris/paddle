class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 300, minimum: 3 }
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true, length: { maximum: 140, minimum: 3 }
  validates :address, presence: true, length: { maximum: 140, minimum: 3 }

  def lesson_full?
    if max_students != comments.count
      return true
    end
  end


end
