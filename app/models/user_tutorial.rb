class UserTutorial < ApplicationRecord
  belongs_to :user
  belongs_to :tutorial, dependent: :destroy
end
