class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 140, minimum: 3 }
  validates :date, presence: true, length: { maximum: 8, minimum: 6 }
  validates :time, presence: true, length: { maximum: 7, minimum: 3 }
  validates :location, presence: true, length: { maximum: 140, minimum: 3 }
  validates :address, presence: true, length: { maximum: 140, minimum: 3 }
end
