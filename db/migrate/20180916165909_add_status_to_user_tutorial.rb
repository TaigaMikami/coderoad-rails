class AddStatusToUserTutorial < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tutorials, :is_done, :integer, default: 0, null: false, comment: '0:まだ, 1:完了'
  end
end
