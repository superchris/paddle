class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates :full_name, presence: true
  validates :phone_number, presence: true, length: { maximum: 13, minimum: 10 }
  validates :email, presence: true, length: { maximum: 140, minimum: 3 }
  validates :skill_level, presence: true
  validates :message, presence: true, length: { maximum: 300, minimum: 3 }

  SKILL_LEVEL = {
    'LEVEL 1- Beginner' => '1_level',
    'LEVEL 2' => '2_level',
    'LEVEL 3' => '3_level',
    'LEVEL 4' => '4_level',
    'LEVEL 5- Very advanced' => '5_level',
  }

  def humanized_skill
      SKILL_LEVEL.invert[self.skill_level]
    end
end
