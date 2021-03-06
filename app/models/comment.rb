class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  after_create :send_comment_email

  validates :full_name, presence: true
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :email, presence: true, length: { maximum: 140, minimum: 3 }
  validates :skill_level, presence: true
  # validates :message, presence: true, length: { maximum: 300, minimum: 1 }

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

  def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end
end
