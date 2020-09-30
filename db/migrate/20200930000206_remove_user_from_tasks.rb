class RemoveUserFromTasks < ActiveRecord::Migration[6.0]
  def change
  	remove_reference :tasks, :user, index: true, foreign_key: true
  end
end
