class CreateAssignmentUserJoinTable < ActiveRecord::Migration
  def change
    create_table :assignments_users, :id => false do |t|
      t.integer :assignment_id
      t.integer :user_id
    end
  end
end
