class Tutorial < ApplicationRecord
  has_many :user_tutorials, foreign_key: 'tutorial_id'
  has_many :users, through: :user_tutorials
  accepts_nested_attributes_for :user_tutorials
  acts_as_taggable
  is_impressionable

  scope :week_post, -> { where('created_at > ?', 7.days.ago )}

  def iine?(user)
    users.include?(user)
  end
end
