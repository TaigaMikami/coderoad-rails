class Tutorial < ApplicationRecord
  has_many :users, through: :user_tutorials
  has_many :user_tutorials
  accepts_nested_attributes_for :user_tutorials
  acts_as_taggable
end
