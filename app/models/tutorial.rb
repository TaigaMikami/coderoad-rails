class Tutorial < ApplicationRecord
  has_many :user_tutorials, foreign_key: 'tutorial_id'
  has_many :users, through: :user_tutorials
  accepts_nested_attributes_for :user_tutorials
  acts_as_taggable
end
